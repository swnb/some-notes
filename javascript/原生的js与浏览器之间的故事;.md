# 原生的js与浏览器之间的故事;

如何原生的取一个p的节点

```javascript
let arrayLike=document.querySelectorAll('p');
Array.from(arrayLike).forEach(function(a){
  console.log(a.firstChild.nodeValue);
  //文本本身就是一个节点textNode
   a.firstChild.nodeValue='zhang';//覆盖元素的文本节点;
   console.log(a.firstChild.nodeType);
})
```

 另外的增添文本节点的方法：

```javascript
var arraylike=document.querySelectorAll("p");
Array.from(arrayLike).forEach(function(a){
  var text=document.createTextNode("string:hello world");
  a.appendChild(text);
})
```

节点的遍历

```javascript
var p=document.getElementById('pid');
for (var i of p.childNodes){
  console.log(i);
}
```