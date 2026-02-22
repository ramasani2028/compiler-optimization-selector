import os

def create_test_cases(output_dir="test_cases"):
    if not os.path.exists(output_dir):
        os.makedirs(output_dir)
    
    test_cases = {
        "01_hello_world.c": """
int printf(const char *, ...);
int main() {
    printf("Hello, Compiler!\\n");
    return 0;
}
""",
        "02_arithmetic.c": """
int main() {
    int a = 10, b = 20;
    int sum = a + b;
    int diff = a - b;
    int prod = a * b;
    int quot = b / a;
    return sum;
}
""",
        "03_if_else.c": """
int main() {
    int x = 10;
    if (x > 5) {
        return 1;
    } else {
        return 0;
    }
}
""",
        "04_while_loop.c": """
int main() {
    int i = 0;
    int sum = 0;
    while (i < 10) {
        sum += i;
        i++;
    }
    return sum;
}
""",
        "05_for_loop.c": """
int main() {
    int sum = 0;
    for (int i = 0; i < 10; i++) {
        sum += i;
    }
    return sum;
}
""",
        "06_nested_loops.c": """
int main() {
    int count = 0;
    for (int i = 0; i < 5; i++) {
        for (int j = 0; j < 5; j++) {
            count++;
        }
    }
    return count;
}
""",
        "07_functions.c": """
int add(int a, int b) {
    return a + b;
}
int main() {
    return add(5, 7);
}
""",
        "08_recursion.c": """
int factorial(int n) {
    if (n <= 1) return 1;
    return n * factorial(n - 1);
}
int main() {
    return factorial(5);
}
""",
        "09_arrays.c": """
int main() {
    int arr[5] = {1, 2, 3, 4, 5};
    return arr[2];
}
""",
        "10_pointers.c": """
int main() {
    int x = 10;
    int *p = &x;
    return *p;
}
""",
        "11_array_pointers.c": """
int main() {
    int arr[3] = {10, 20, 30};
    int *p = arr;
    return *(p + 1);
}
""",
        "12_structs.c": """
struct Point {
    int x;
    int y;
};
int main() {
    struct Point p = {10, 20};
    return p.x + p.y;
}
""",
        "13_nested_structs.c": """
struct Point { int x, y; };
struct Rect { struct Point p1, p2; };
int main() {
    struct Rect r = {{0,0}, {10,10}};
    return r.p2.x;
}
""",
        "14_switch_case.c": """
int main() {
    int x = 2;
    switch(x) {
        case 1: return 10;
        case 2: return 20;
        default: return 0;
    }
}
""",
        "15_ternary_op.c": """
int main() {
    int x = 10;
    return (x > 5) ? 1 : 0;
}
""",
        "16_bitwise_ops.c": """
int main() {
    int a = 5, b = 3;
    return (a & b) | (a ^ b);
}
""",
        "17_float_arithmetic.c": """
int main() {
    float a = 5.5, b = 2.2;
    float res = a * b;
    return (int)res;
}
""",
        "18_type_casting.c": """
int main() {
    double d = 3.14;
    int i = (int)d;
    return i;
}
""",
        "19_global_vars.c": """
int g_x = 100;
int main() {
    return g_x + 5;
}
""",
        "20_static_vars.c": """
int counter() {
    static int c = 0;
    c++;
    return c;
}
int main() {
    counter();
    return counter();
}
""",
        "21_unions.c": """
union Data {
    int i;
    float f;
};
int main() {
    union Data d;
    d.i = 10;
    return d.i;
}
""",
        "22_enums.c": """
enum Color { RED, GREEN, BLUE };
int main() {
    enum Color c = GREEN;
    return (int)c;
}
""",
        "23_void_pointers.c": """
int main() {
    int x = 10;
    void *ptr = &x;
    return *(int*)ptr;
}
""",
        "24_do_while.c": """
int main() {
    int i = 0;
    do {
        i++;
    } while (i < 5);
    return i;
}
""",
        "25_complex_expression.c": """
int main() {
    int a = 1, b = 2, c = 3, d = 4;
    return (a + b) * (c - d) / (a + d);
}
"""
    }

    print(f"Generating {len(test_cases)} test cases in '{output_dir}'...")
    for filename, content in test_cases.items():
        with open(os.path.join(output_dir, filename), "w") as f:
            f.write(content.strip())
        print(f"Created {filename}")
    print("Done.")

if __name__ == "__main__":
    create_test_cases()
