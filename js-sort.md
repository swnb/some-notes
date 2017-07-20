# JS-sort

### 冒泡

将第一个元素与后面的每个元素比较,大的元素向后放;这样的过程循环的次数等于数据的长度减1次;也就是说只需要重复`arr.length-1`次,因为最后一次的排序是第一个和第一个交换(最小的和最小的比较),没有必要;

```javascript
for (let index=0;index<arr.length-1;index++){}
```

对于冒泡的过程没必要每一次都完全遍历,每次遍历的次数都可以减少一位,因为后面已经排序好了;

所以内部代码的属性如下:

```javascript
for (let j=1;j<arr.length-1-index;j++){
  if(arr[j]<arr[j-1]){
    [arr[j],arr[j-1]]=[arr[j-1],arr[j]]; //es6的解析构造
  }
}
```

合起来的最优化写法:

```javascript
let arr=[3,2,1];
for (let index=0;index<arr.length-1;index++){
    for (let j=1 ; j <= arr.length-1-index ; j++){
    if(arr[j]<arr[j-1]){
      [arr[j],arr[j-1]]=[arr[j-1],arr[j]]; //es6的解析构造
    }
  }
}
console.log(arr);
```

需要注意的点

* 外部循环过程只需要执行length-1次;

* 内部循环排序过程每次循环减少一次,因为尾部已经排序好了

* 使用析构方法可以简单的实现变量值交换,这里有一个更牛的写法

  > `a=[b,b=a][0]`

***

### 插入排序

将一段数据依次插入一段已经排好的数据内,对于一个无序数组,就是就是将后面的数据与前面的数据整合.

这个过程要重复`arr.length-1`次;

每次都要判断插入位置;

```javascript
//容易看懂的排序实现
let arr=[3,2,1];
for (let index = 1; index < arr.length; index++) {
   if (arr[index] > arr[index - 1]) { 	//如果大就不用更换
            break
        } else if (arr[index] < arr[0]) { //如果最小就放在最前面
            arr.unshift(arr[index]);
            arr.splice(index + 1, 1);
            break
        }
    for (let i = 0; i < index; i++) {
         if (arr[index] >= arr[i] && arr[index] < arr[i + 1]) {
            arr.splice(i + 1, 0, arr[index]);
            arr.splice(index+1, 1);
            break
        }
    }
}
console.log(arr);
```

```javascript
//精简版本的排序实现
function sort(arr) {
    let len = arr.length;
    let preIndex, current;
    for (let i = 1; i < len; i++) {
        preIndex = i - 1;
        current = arr[i];
        while (preIndex >= 0 && arr[preIndex] > current) {
            arr[preIndex + 1] = arr[preIndex];
            preIndex--;
        }
        arr[preIndex + 1] = current;
    }
    return arr;
}
```

后面的代码其实就是伪冒泡法,其实两者很像,只是更改没有冒泡那么频繁,检查数组是一样的

***

### 选择排序过于糟糕就不不介绍了

