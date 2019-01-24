// * lambda
const sum = (acc, e) => acc + e;

[1, 2].reduce(sum, 0);

// * function
const foo = (a, b) => {
	console.log(a + b);
};

// * call apply
const arg = [1, 2];
foo.call(null, ...arg);
foo.apply(null, arg);

// * 特殊操作
(() => () => {})();

// * 函数也是对象
const bar = () => bar;
bar.bar = bar;

bar()()()
	.bar()()
	.bar();

// * async
const wait = async () => {
	await new Promise(res => setTimeout(res, 1000));
	console.log('done');
};

// * generator
function* produce() {
	let count = 0;
	while (true) {
		yield count++;
	}
}
const a = produce();
const { value } = a.next();
