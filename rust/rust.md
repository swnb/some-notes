# rust

## learning rust

```rust
let mut mutData = 10; // 可变的数据
let immutData = 10; // 不可变的数据
```

rust 里面的表达式 很强大，即便是 if 语句也可以作为表达式的一部分，

```rust
fn main(){
	let x = if x == 0 { 0 } else { 1 }; // powerfull

	let mut count = 0;
	let x = loop {
		count+=1;
		if count > 10{ // 这是一个表达式
			break 199;
		}
	};

	println!("{}",x); //199
}
```

rust 里面除了实现 copy tail 的类型之外 , 移动 会使之前的变量无效,所以

```rust
	let x = 1;
	let y = x;
	// Copy 可以
	let x = "sdfs";
	let y = x.clone();
	// 深度拷贝是可以的
```

如果要调用一个函数,那么你的函数就是这个样子

```rust
fn cal_length(string: String) -> (String, usize) {
	let len = string.len();
	(string, len)
}
```

上面的代码的意味着你在获取所有权之后交还所有权
通过元祖实现多值返回起源 lisp, 类是 py swift 一样 , (golang 的多值返回不依赖抽象的数据结构)

那么下面如果你想改变一个数据,那么你可以这么做

```rust
fn push_str(string: String) -> String {
	let mut string = string;
	string.push_str("dadas");
	string
}
```

借用数据

```
fn borrow(string: &mut String){
	string.push_str("dasda");
}
```

对于数据的借用,你需要注意的是,
`let mut s = "some string"`

1. 可变的借用 `&mut s`
2. 不可变的借用 `&s`

可变的引用不可以同时出现
可变的引用和不可变的引用不能同时出现
不可变的引用可以同时出现,因为是只读

透过悬挂指针看看借用和移动的区别

```rust
fn move() -> String {
	let string = String::from("dada");
	string
}

fn borrow() -> &String {
	let string = "dadsa"
	&string // error code
}
```

rust 的切片的写法很多样

```rust
let string = String::from("some string");
let s = &string[..]
let s = &string[1..2]
let s = &string[..2]
let s = &string[1..=2]
```

当你在引用 string 的 slice 后清空原先的引用,会报错,看下面的代码

```rust
let mut string = String::from("some string");
let slices = &string[1..2];
string.clear();
println!("{}", slices);
```
