# this 深入理解

* 原型链共用

  看代码

  ```javascript
  let pro = {
      val: 1,
      change() {
          pro.val = 2
      }
  }
  let a = function() {};
  a.prototype = pro;
  let a1 = new a();
  let a2 = new a();
  console.log(a1.val, a2.val);
  a1.change();
  console.log(a1.val, a2.val);
  ```

  我们把上面的代码更改`pro.val -->> this.val`

  ```javascript
  let pro = {
      val: 1,
      change() {
          this.val = 2
      }
  }
  let a = function() {};
  a.prototype = pro;
  let a1 = new a();
  let a2 = new a();
  console.log(a1.val, a2.val);
  a1.change();
  console.log(a1.val, a2.val);
  ```

  在上面的代码中,访问的val究竟是怎么变化的,我来总结下

  `pro.val`:

  ​	两次console.log的val都是通过原型链访问到的val,也就是pro.val;	

  `this.val`:

  ​	第一次两者访问都是pro.val

  ​	但是调用change函数后,两者访问的val就不同了,也就是说,this.val是在进行一个赋值,这时访问的val,

  ​	一个是`a1.val`,一个是`pro.val`;

