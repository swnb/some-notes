let a: Array<number> = Array(10000).fill(0);
a = a.reduce(
    (p, _, index) => {
        p[index + 1] = p[index];
        return p;
    },
    [1]
);
console.log(a);
// reverse
console.time("reverse");
a.reverse();
console.timeEnd("reverse");

console.time("reverse");
a = a.reverse();
console.timeEnd("reverse");

let res: number[] = [];
console.time("reverse");
a.reduce((res, c, index) => {
    res.push(c);
    return res;
}, res);
console.timeEnd("reverse");

res = [];
console.time("reverse");
a = a.reduce((res, c, index) => {
    res.push(c);
    return res;
}, res);
console.timeEnd("reverse");

res = [];
console.time("reverse");
a = a.reduce((res, c, index) => {
    res.unshift(c);
    return res;
}, res);
console.timeEnd("reverse");

export {};
