package main

func foo(x int) func(int) int {
	return func(y int) int {
		return x + y
	}
}

func main() {
}
