#include <stdio.h>

int fib(int n)
{
	return n <= 2 ? n : (fib(n - 1) + fib(n - 2));
}

int main()
{
	int result = fib(45);
	printf("%d", result);
}