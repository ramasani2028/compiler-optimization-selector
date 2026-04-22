import os
import torch
import subprocess
import sys
import re
from ml_optimizer import DQN, ACTIONS, CLANG_PATH, CompilerEnv

MODEL_PATH = "ml_optimizer_model.pth"

def get_best_optimization(c_file_path):
    # 1. Generate unoptimized IR to extract features
    env = CompilerEnv(c_file_path)
    state = torch.FloatTensor(env.features)
    
    # 2. Load model and predict
    model = DQN(8, len(ACTIONS))
    if os.path.exists(MODEL_PATH):
        model.load_state_dict(torch.load(MODEL_PATH))
    model.eval()
    
    with torch.no_grad():
        q_values = model(state)
        action_idx = torch.argmax(q_values).item()
    
    return ACTIONS[action_idx]

def apply_optimization(input_c, output_ll, action):
    print(f"Applying AI-Selected Optimization: {action}")
    
    if action.startswith("-O"):
        subprocess.run([CLANG_PATH, action, "-S", "-emit-llvm", input_c, "-o", output_ll], capture_output=True)
    else:
        # Step 1: Generate unoptimized IR first
        temp_unopt = "temp_unopt_selector.ll"
        subprocess.run([CLANG_PATH, "-O0", "-Xclang", "-disable-O0-optnone", "-S", "-emit-llvm", input_c, "-o", temp_unopt], capture_output=True)
        # Step 2: Try applying passes
        cmd = [CLANG_PATH, "-S", "-emit-llvm", "-mllvm", f"-passes={action}", temp_unopt, "-o", output_ll]
        res = subprocess.run(cmd, capture_output=True)
        
        # Fallback if custom passes fail
        if not os.path.exists(output_ll) or os.path.getsize(output_ll) == 0:
            print(f"Warning: Custom passes '{action}' failed. Falling back to -O2.")
            subprocess.run([CLANG_PATH, "-O2", "-S", "-emit-llvm", input_c, "-o", output_ll], capture_output=True)
            
        if os.path.exists(temp_unopt): os.remove(temp_unopt)

def main():
    if len(sys.argv) < 2:
        print("Usage: python optimization_selector.py <input_c_file>")
        return

    input_c = sys.argv[1]
    if not os.path.exists(input_c):
        print(f"Error: {input_c} not found.")
        return

    output_ll = os.path.splitext(input_c)[0] + "_ai_opt.ll"
    best_action = get_best_optimization(input_c)
    apply_optimization(input_c, output_ll, best_action)
    print(f"Optimized IR saved to {output_ll}")

if __name__ == "__main__":
    main()
