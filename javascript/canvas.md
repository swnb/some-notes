# canvas

在页面更新时间大致为 1000/60;在 setInterval 需要的时间在 canvas 就这样做。

定时器 bug：当离开页面的时候，为了性能问题，要求这个页面停止定时器计数来提高性能;requestAnimationFrame(funcName);详细可以看张鑫旭;

```javascript
let can = document.getElementById("canvas");
window.onresize = function() {};
let cxt = can.getContext("2d");
cxt.fillStyle = "red";
cxt.rect(x, y, w, h);
cxt.fill(); //满
cxt.stroke(); //空
```

重绘:ctx.clearRect(x,y,w,h);

但是对于要实现一个彗星的尾巴，就需要一些特别的方法，比如

用透明层来实现覆盖：fillStyle='rgba(0,0,0,0.1)‘不断重绘来实现这样的尾巴效果。

ctx.beginPath():抬起笔重新写。

如何理解clip这个东西

基本要素

首先save保存先前的状态，之后clip切割出你要的路径，之后才能画出你的图像，最后 restore。