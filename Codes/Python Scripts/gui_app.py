import tkinter as tk
from tkinter import filedialog, messagebox
import ttkbootstrap as ttk
from ttkbootstrap.constants import *
import os
import subprocess
import threading
import time
from optimization_selector import get_best_optimization, apply_optimization
from ml_optimizer import CLANG_PATH, ACTIONS, CompilerEnv

# Matplotlib integration
import matplotlib
matplotlib.use("TkAgg")
from matplotlib.figure import Figure
from matplotlib.backends.backend_tkagg import FigureCanvasTkAgg

# Codecarbon integration
from codecarbon import OfflineEmissionsTracker

class CompilerGUI:
    def __init__(self, root):
        self.root = root
        self.root.title("AI-Assisted Compiler Optimization Selector")
        self.root.geometry("1100x800")
        
        self.selected_file = None
        
        # UI Layout
        self.create_widgets()
        
    def create_widgets(self):
        # Top Panel: File Selection
        top_frame = ttk.Frame(self.root, padding=10)
        top_frame.pack(fill=tk.X)
        
        ttk.Button(top_frame, text="Select C Benchmark", command=self.select_file, bootstyle=PRIMARY).pack(side=tk.LEFT, padx=10)
        self.file_label = ttk.Label(top_frame, text="No file selected", font=("Arial", 12, "italic"), bootstyle=SECONDARY)
        self.file_label.pack(side=tk.LEFT)
        
        # Middle Panel: Notebook for Tabs
        self.notebook = ttk.Notebook(self.root, bootstyle=LIGHT)
        self.notebook.pack(fill=tk.BOTH, expand=True, padx=10, pady=5)
        
        self.tabs = {}
        for name in ["Unoptimized", "-O3", "AI"]:
            frame = ttk.Panedwindow(self.notebook, orient=tk.HORIZONTAL)
            self.notebook.add(frame, text=f"{name} View")
            
            feat_text = tk.Text(frame, width=30, height=15, font=("Courier", 10), bg="white", fg="black", insertbackground="black")
            frame.add(feat_text)
            feat_text.insert(tk.END, f"{name} IR Features will appear here...")
            
            ir_text = tk.Text(frame, width=70, height=15, font=("Courier", 10), bg="white", fg="black", insertbackground="black")
            frame.add(ir_text)
            ir_text.insert(tk.END, f"{name} IR will appear here...")
            
            self.tabs[name] = {"feat": feat_text, "ir": ir_text}
            
        # Add Visualizations Tab
        self.viz_frame = ttk.Frame(self.notebook)
        self.notebook.add(self.viz_frame, text="Visualizations")
        
        # Create figure for plot
        self.fig = Figure(figsize=(10, 6), dpi=100)
        self.fig.patch.set_facecolor('white') # user requested white background
        self.canvas = FigureCanvasTkAgg(self.fig, master=self.viz_frame)
        self.canvas.get_tk_widget().pack(fill=tk.BOTH, expand=True)
        self._draw_empty_plot()
        
        # Bottom Panel: Actions & Results
        bottom_frame = ttk.Frame(self.root, padding=10)
        bottom_frame.pack(fill=tk.BOTH, expand=True)
        
        # Optimization Buttons
        btn_frame = ttk.Frame(bottom_frame)
        btn_frame.pack(side=tk.LEFT, padx=10)
        
        ttk.Button(btn_frame, text="Run Default -O3", command=lambda: self.run_optimization("-O3"), width=20, bootstyle=WARNING).pack(pady=5)
        ttk.Button(btn_frame, text="Run AI Optimization", command=lambda: self.run_optimization("AI"), width=20, bootstyle=SUCCESS).pack(pady=5)
        
        # Results Table
        self.tree = ttk.Treeview(bottom_frame, columns=("Metric", "Default -O3", "AI-Selected"), show="headings", bootstyle=PRIMARY)
        self.tree.heading("Metric", text="Metric")
        self.tree.heading("Default -O3", text="Default -O3")
        self.tree.heading("AI-Selected", text="AI-Selected")
        self.tree.pack(side=tk.RIGHT, fill=tk.BOTH, expand=True, padx=10)
        
        # Security Visualizer Badges
        sec_frame = ttk.Frame(btn_frame)
        sec_frame.pack(pady=15)
        ttk.Label(sec_frame, text="Security Status:", font=("Arial", 10, "bold")).pack()
        self.sec_o3_badge = ttk.Label(sec_frame, text="-O3: Awaiting", bootstyle="secondary-inverse", width=18, anchor="center")
        self.sec_o3_badge.pack(pady=2)
        self.sec_ai_badge = ttk.Label(sec_frame, text="AI: Awaiting", bootstyle="secondary-inverse", width=18, anchor="center")
        self.sec_ai_badge.pack(pady=2)
        
        # Status Bar and Progress
        status_frame = ttk.Frame(self.root)
        status_frame.pack(fill=tk.X, side=tk.BOTTOM, padx=10, pady=5)
        
        self.progress = ttk.Progressbar(status_frame, mode='indeterminate', bootstyle=INFO)
        self.progress.pack(side=tk.RIGHT, fill=tk.X, expand=True, padx=(10, 0))
        
        self.status_var = tk.StringVar()
        self.status_var.set("Ready")
        self.status_label = ttk.Label(status_frame, textvariable=self.status_var, font=("Arial", 10))
        self.status_label.pack(side=tk.LEFT)
        
        # Initial metrics
        self.results = {
            "Exec Time": ["N/A", "N/A"],
            "Code Size": ["N/A", "N/A"],
            "Carbon (gCO2)": ["N/A", "N/A"],
            "Security": ["N/A", "N/A"],
            "Passes": ["-O3", "N/A"]
        }
        self.update_table()

    def select_file(self):
        filename = filedialog.askopenfilename(filetypes=[("C files", "*.c"), ("All files", "*.*")])
        if filename:
            self.selected_file = filename
            self.file_label.config(text=os.path.basename(filename))
            self.extract_and_show_ir()

    def extract_and_show_ir(self):
        # Generate unoptimized IR
        self.status_var.set("Generating Unoptimized IR...")
        self.progress.start()
        
        def task():
            temp_ll = "gui_temp_unopt.ll"
            subprocess.run([CLANG_PATH, "-O0", "-Xclang", "-disable-O0-optnone", "-S", "-emit-llvm", self.selected_file, "-o", temp_ll], capture_output=True)
            
            if os.path.exists(temp_ll):
                self.populate_tab("Unoptimized", temp_ll)
                os.remove(temp_ll)
            
            self.root.after(0, lambda: self.status_var.set("Ready"))
            self.root.after(0, self.progress.stop)
            
        threading.Thread(target=task).start()
            
    def populate_tab(self, tab_name, ll_file):
        if not os.path.exists(ll_file): return
        with open(ll_file, 'r') as f:
            content = f.read()

        ir_widget = self.tabs[tab_name]["ir"]
        ir_widget.delete("1.0", tk.END)

        # --- Configure IR syntax highlight tags once ---
        ir_widget.tag_config("kw",       foreground="#0000ff", font=("Courier", 10, "bold"))  # LLVM keywords
        ir_widget.tag_config("type",     foreground="#008080")  # types: i32, i64, ptr …
        ir_widget.tag_config("comment",  foreground="#008000", font=("Courier", 10, "italic"))  # ; comments
        ir_widget.tag_config("security", foreground="#ff4500", font=("Courier", 10, "bold"))    # assert_failed stores
        ir_widget.tag_config("removed",  foreground="#ff0000", font=("Courier", 10, "bold"))    # highlight if absent
        ir_widget.tag_config("label",    foreground="#800080")  # basic block labels

        KEYWORDS = {"define", "declare", "call", "ret", "br", "load", "store",
                    "alloca", "icmp", "fcmp", "phi", "select", "getelementptr",
                    "add", "sub", "mul", "udiv", "sdiv", "and", "or", "xor",
                    "lshr", "ashr", "shl", "zext", "sext", "trunc", "bitcast",
                    "tail", "musttail", "notail", "target", "attributes",
                    "unreachable", "switch", "invoke", "landingpad", "resume"}
        TYPES     = {"i1", "i8", "i16", "i32", "i64", "i128",
                     "float", "double", "void", "ptr", "label"}

        display = content[:8000]
        for line in display.split("\n"):
            stripped = line.lstrip()
            start_idx = ir_widget.index("end-1c")
            ir_widget.insert(tk.END, line + "\n")
            end_idx = ir_widget.index("end-1c")

            # Comments — colour the whole line
            if stripped.startswith(";"):
                ir_widget.tag_add("comment", start_idx, end_idx)
                continue

            # Basic-block labels (lines ending with ':')
            if stripped.endswith(":") and not stripped.startswith("%") and " " not in stripped:
                ir_widget.tag_add("label", start_idx, end_idx)
                continue

            # Security-sensitive stores
            if "assert_failed" in line and "store" in line:
                ir_widget.tag_add("security", start_idx, end_idx)
                continue

            # Token-level highlighting for keywords and types
            import re
            for m in re.finditer(r'\b(\w+)\b', line):
                tok = m.group(1)
                char_start = f"{start_idx} + {m.start()} chars"
                char_end   = f"{start_idx} + {m.end()} chars"
                if tok in KEYWORDS:
                    ir_widget.tag_add("kw", char_start, char_end)
                elif tok in TYPES:
                    ir_widget.tag_add("type", char_start, char_end)

        if len(content) > 8000:
            ir_widget.insert(tk.END, "\n... (truncated)")

        # --- Feature panel ---
        env = CompilerEnv(self.selected_file)
        features = env.extract_features(ll_file)
        feature_names = ["Blocks", "Insts", "Branches", "Memory", "Math", "Float", "Vector", "Calls"]

        if tab_name == "Unoptimized":
            self.unopt_features = features

        unopt_feats = self.unopt_features if hasattr(self, 'unopt_features') else features

        feat_widget = self.tabs[tab_name]["feat"]
        feat_widget.delete("1.0", tk.END)
        feat_widget.tag_config("improved",  foreground="#008000", font=("Courier", 10, "bold"))
        feat_widget.tag_config("worsened",  foreground="#ff0000", font=("Courier", 10, "bold"))
        feat_widget.tag_config("unchanged", foreground="#555555")
        feat_widget.tag_config("header",    font=("Courier", 10, "bold"), foreground="#000000")

        feat_widget.insert(tk.END, f"[{tab_name}] Features:\n", "header")
        feat_widget.insert(tk.END, "=" * 25 + "\n")

        for name, val, unopt_val in zip(feature_names, features, unopt_feats):
            diff = int(val) - int(unopt_val)
            diff_str = ""
            tag = "unchanged"
            if tab_name != "Unoptimized" and diff != 0:
                diff_str = f" (+{diff})" if diff > 0 else f" ({diff})"
                tag = "improved" if diff < 0 else "worsened"
            feat_widget.insert(tk.END, f"{name:<10}: {int(val)}{diff_str}\n", tag)

    def run_optimization(self, mode):
        if not self.selected_file:
            messagebox.showwarning("Warning", "Please select a C benchmark first!")
            return
            
        self.status_var.set(f"Running Optimization: {mode}...")
        self.progress.start()
        threading.Thread(target=self.optimization_thread, args=(mode,)).start()

    def optimization_thread(self, mode):
        base = os.path.basename(self.selected_file).split('.')[0]
        idx = 0 if mode == "-O3" else 1
        
        strategy = "-O3"
        if mode == "AI":
            self.status_var.set(f"AI Model selecting best optimization...")
            strategy = get_best_optimization(self.selected_file)
            self.results["Passes"][1] = strategy
        
        self.status_var.set(f"Applying Optimization ({strategy})...")
        ll_file = f"gui_opt_{mode}.ll"
        exe_file = f"gui_opt_{mode}.exe"
        
        # Apply optimization
        apply_optimization(self.selected_file, ll_file, strategy)

        # Compile and measure
        self.status_var.set(f"Compiling IR to Executable...")
        subprocess.run([CLANG_PATH, ll_file, "-o", exe_file], capture_output=True)
        
        if os.path.exists(exe_file):
            # Size
            self.results["Code Size"][idx] = f"{os.path.getsize(exe_file)} bytes"
            
            # Use CodeCarbon to track emissions during execution
            self.status_var.set(f"Executing Benchmark and Tracking Emissions...")
            
            tracker = OfflineEmissionsTracker(country_iso_code="USA", log_level="error", measure_power_secs=0.1)
            tracker.start()
            
            start = time.time()
            subprocess.run([exe_file], capture_output=True, timeout=5)
            exec_time = time.time() - start
            self.results["Exec Time"][idx] = f"{exec_time:.4f} s"
            
            emissions: float = tracker.stop()
            # Convert kg to g for easier reading, if emissions are very low
            emissions_g = emissions * 1000 if emissions is not None else 0.0
            
            self.results["Carbon (gCO2)"][idx] = f"{emissions_g:.6e}"
            
            # Security: detect if assert_failed STORES still exist in IR
            import re as _re
            security_status = "Preserved ✅"
            with open(ll_file, 'r') as f:
                ir_content = f.read()
            is_security_file = "security_check" in self.selected_file.lower()
            if is_security_file:
                has_store = bool(_re.search(r'store.*i32 1.*@assert_failed|assert_failed.*store', ir_content))
                if not has_store:
                    security_status = "Removed ⚠️ (UNSAFE)"
            self.results["Security"][idx] = security_status
            
            # Visually update the dedicated Security Badges
            badge = self.sec_ai_badge if mode == "AI" else self.sec_o3_badge
            if "Removed" in security_status:
                self.root.after(0, lambda b=badge: b.config(text=f"REMOVED! 🛑", bootstyle="danger-inverse"))
            else:
                self.root.after(0, lambda b=badge: b.config(text=f"PRESERVED ✅", bootstyle="success-inverse"))

            # Cleanup
            os.remove(exe_file)
        
        if os.path.exists(ll_file):
            ll_snapshot = ll_file + ".snapshot"
            import shutil
            shutil.copy2(ll_file, ll_snapshot)     # keep a copy so viewer has the file
            os.remove(ll_file)
            def update_tab_ui(t=mode, f=ll_snapshot):
                self.populate_tab(t, f)
                if os.path.exists(f): os.remove(f)  # clean up snapshot after display
            self.root.after(0, update_tab_ui)

        self.root.after(0, self.update_table)
        self.root.after(0, self._update_plot)
        self.root.after(0, lambda: self.status_var.set("Ready"))
        self.root.after(0, self.progress.stop)

    def update_table(self):
        for item in self.tree.get_children():
            self.tree.delete(item)
            
        for metric, vals in self.results.items():
            self.tree.insert("", tk.END, values=(metric, vals[0], vals[1]))

    def _draw_empty_plot(self):
        self.fig.clear()
        ax = self.fig.add_subplot(111)
        ax.set_facecolor('white')
        ax.text(0.5, 0.5, "Run optimizations to see visualizations", 
                horizontalalignment='center', verticalalignment='center',
                transform=ax.transAxes, color='black', fontsize=12)
        ax.tick_params(colors='black')
        self.canvas.draw()
        
    def _update_plot(self):
        self.fig.clear()
        
        # Check if we have data to plot
        if "N/A" in self.results["Exec Time"] or "N/A" in self.results["Code Size"]:
            self._draw_empty_plot()
            return
            
        try:
            o3_time = float(self.results["Exec Time"][0].replace(" s", "")) if self.results["Exec Time"][0] != "N/A" else 0.0
            ai_time = float(self.results["Exec Time"][1].replace(" s", "")) if self.results["Exec Time"][1] != "N/A" else 0.0
            
            o3_size = float(self.results["Code Size"][0].replace(" bytes", "")) if self.results["Code Size"][0] != "N/A" else 0.0
            ai_size = float(self.results["Code Size"][1].replace(" bytes", "")) if self.results["Code Size"][1] != "N/A" else 0.0
            
            o3_carbon = self.results["Carbon (gCO2)"][0]
            ai_carbon = self.results["Carbon (gCO2)"][1]
            o3_carbon = float(o3_carbon) if o3_carbon != "N/A" else 0.0
            ai_carbon = float(ai_carbon) if ai_carbon != "N/A" else 0.0
            
            o3_sec = 1 if "Preserved" in self.results["Security"][0] else 0
            ai_sec = 1 if "Preserved" in self.results["Security"][1] else 0
        except ValueError:
            self._draw_empty_plot()
            return

        import numpy as np

        ax1 = self.fig.add_subplot(221)
        ax2 = self.fig.add_subplot(222)
        ax3 = self.fig.add_subplot(223)
        ax4 = self.fig.add_subplot(224, polar=True)
        
        labels = ['Default -O3', 'AI-Selected']
        x = np.arange(2)
        
        # 1. Exec Time - Area Chart Overlay
        ax1.plot(x, [o3_time, ai_time], marker='D', markersize=8, color='#3498db', linewidth=3, zorder=3)
        ax1.fill_between(x, [o3_time, ai_time], color='#3498db', alpha=0.3, zorder=2)
        ax1.set_title('Execution Time (seconds)', fontweight='bold', fontsize=10)
        ax1.set_xticks(x)
        ax1.set_xticklabels(labels)
        for i, v in enumerate([o3_time, ai_time]):
            ax1.text(i, v + (max(o3_time, ai_time)*0.05), f"{v:.4f}s", ha='center', va='bottom', fontweight='bold', fontsize=9)
            
        # 2. Code Size - Styled Horizontal Bar Chart
        bars = ax2.barh(labels, [o3_size, ai_size], color=['#e74c3c', '#c0392b'], height=0.5, edgecolor='black', zorder=3)
        ax2.set_title('Code Size (Bytes)', fontweight='bold', fontsize=10)
        for bar in bars:
            width = bar.get_width()
            ax2.text(width - (max(o3_size, ai_size)*0.05), bar.get_y() + bar.get_height()/2, 
                     f"{int(width)}", va='center', ha='right', color='white', fontweight='bold', fontsize=9)
                     
        # 3. Carbon Emissions - Dual Bar/Line Chart
        ax3.bar(x, [o3_carbon, ai_carbon], color='#2ecc71', width=0.4, alpha=0.7, edgecolor='black', hatch='//')
        ax3_twin = ax3.twinx()
        ax3_twin.plot(x, [o3_carbon, ai_carbon], color='#27ae60', marker='s', markersize=10, linewidth=3, linestyle='--')
        ax3_twin.set_yticks([]) # Hide twin y-ticks to keep it clean
        ax3.set_title('Carbon Footprint (gCO2)', fontweight='bold', fontsize=10)
        ax3.set_xticks(x)
        ax3.set_xticklabels(labels)
        for i, v in enumerate([o3_carbon, ai_carbon]):
            ax3.text(i, v + (max(o3_carbon, ai_carbon)*0.05), f"{v:.2e}", ha='center', fontweight='bold', fontsize=9)

        # 4. Radar Chart for multivariate comparison
        categories = ['Time (Inv)', 'Size (Inv)', 'Carbon (Inv)', 'Security']
        N = len(categories)
        angles = [n / float(N) * 2 * np.pi for n in range(N)]
        angles += angles[:1]
        
        # Normalize data (inverse for time/size/carbon so larger area = better)
        def norm(val, other):
            if val == 0 and other == 0: return 0.5
            if val == 0: return 1.0
            if other == 0: return 0.1
            return other / (val + other) 
            
        o3_values = [norm(o3_time, ai_time), norm(o3_size, ai_size), norm(o3_carbon, ai_carbon), o3_sec]
        ai_values = [norm(ai_time, o3_time), norm(ai_size, o3_size), norm(ai_carbon, o3_carbon), ai_sec]
        o3_values += o3_values[:1]
        ai_values += ai_values[:1]
        
        ax4.plot(angles, o3_values, linewidth=2, linestyle='solid', label='-O3', color='#e74c3c')
        ax4.fill(angles, o3_values, '#e74c3c', alpha=0.25)
        ax4.plot(angles, ai_values, linewidth=2, linestyle='solid', label='AI', color='#2ecc71')
        ax4.fill(angles, ai_values, '#2ecc71', alpha=0.25)
        
        ax4.set_xticks(angles[:-1])
        ax4.set_xticklabels(categories, fontsize=8, fontweight='bold')
        ax4.set_yticklabels([]) # Hide radial ticks
        ax4.set_title('Overall Performance Radar', fontweight='bold', fontsize=10, pad=15)
        ax4.legend(loc='upper right', bbox_to_anchor=(1.3, 1.1), fontsize=8)

        # Apply grid and background to standard axes (not radar)
        for ax in [ax1, ax2, ax3]:
            ax.set_facecolor('#f8f9fa')
            ax.grid(True, linestyle=':', alpha=0.7, color='gray')
            ax.spines['top'].set_visible(False)
            ax.spines['right'].set_visible(False)

        self.fig.tight_layout()
        self.canvas.draw()

if __name__ == "__main__":
    # Use ttkbootstrap instead of standard tk for modern theming
    root = ttk.Window(themename="cosmo")
    app = CompilerGUI(root)
    root.mainloop()
