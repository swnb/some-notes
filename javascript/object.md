对于一个字典来说，应该创建一个没有原型的对象好过创建一个对象

```javascript
let a = {}; //wrong
let a = Object.create(null);
```
