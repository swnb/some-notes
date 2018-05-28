```javascript
let x = 0;

const main = async () => {
    x += await x;
    console.lg(x);
};

main();
x += 1;
console.log(x);
```
