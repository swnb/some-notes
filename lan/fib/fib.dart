fib(int n) => n <= 2 ? n : fib(n - 1) + fib(n - 2);

void main() {
  print(fib(45));
}
