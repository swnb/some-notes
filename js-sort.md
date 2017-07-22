# JS-sort

### 冒泡

冒泡排序是将第一个元素与后面的每个元素比较,大的元素向后放;这样的过程循环的次数等于数据的长度减1次;也就是说只需要重复`arr.length-1`次,因为最后一次的排序是第一个和第一个交换(最小的和最小的比较),没有必要;

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

冒泡过于低效,在大数据下会有很多的问题

***

### 插入排序

将一段数据依次插入一段已经排好的数据内,对于一个无序数组,就是就是将后面的数据与前面的数据整合.

这个过程要重复`arr.length-1`次;

每次都要判断插入位置;

```javascript
//容易看懂的插入排序实现
let arr=[3,2,1];
for (let index = 1; index < arr.length; index++) {
   if (arr[index] > arr[index - 1]) { 	//如果大就不用更换
			continue;
   } else if (arr[index] < arr[0]) { //如果最小就放在最前面
            arr.unshift(arr[index]);
            arr.splice(index + 1, 1);
            continue;
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

后者其实就是伪冒泡法,其实两者很像,只是更改没有冒泡那么频繁,检查数组是一样的

后者更高效率

#### shelll sort

希尔排序是插入排序的一种优化

***

### 选择排序过于糟糕就不不介绍了

***

### 归并排序

将两个有序数组的第一位进行比较,将小的一个放入新的数组,得到一个排序好的数组:

```javascript
//a,b有序数组
function merge(arr,first,mid,last){
	let a=arr.slice(first,mid+1);
  	let b=arr.slice(mid+1,last+1);
  	let ai=0,bi=0,ci=0,c=[];
 	while(ai<a.length&&bi<b.length){
      if(a[ai]<b[bi]){
        c[ci++]=a[ai++];
      }else if(a[ai]>b[bi]){
        c[ci++]=b[bi++];
      }else{
        c[ci++]=b[bi++];
        c[ci++]=a[ai++];
      }
 	}
 	while(ai<a.length){
      c[ci++]=a[ai++];
 	}
 	while(bi<b.length){
      c[ci++]=b[bi++];
 	}
 	arr.splice(first,last-first+1,...c);
}
```

首先进行数据进行划分

```javascript
function seprate(a){
  for (let gap=1;gap<a.length;gap*=2){
    	mergepass(a,gap);
  }
  return a
}
```

```javascript
function mergepass(a,gap){
  	let i=0;
	for (;gap*2+i-1<a.length;i+=gap*2){   //这里要注意-1的值,要牢记
      	 merge(a,i,i+gap-1,i+2*gap-1);
	}
    if (i + gap - 1 < length) {
        merge(array, i, i + gap - 1, length - 1);
    }
}
```

***

快速排序(最快的排序):

```javascript
function sort(a, start, last) {
    if (start + 1 === last) {
        if (a[start] > a[last]) {
            [a[start], a[last]] = [a[last], a[start]];
        }
        return
    } else if (start === last) {
        return
    }
    let i, j;
    for (let index = start + 1; index <= last; index++) {
        if (a[index] > a[start]) {
            i = index;
            break
        } else if (index === last) {
            [a[start], a[last]] = [a[last], a[start]];
            sort(a, start, last - 1);
            return
        }
    }
    for (let index = last; index > start; index--) {
        if (a[index] < a[start]) {
            j = index;
            break
        } else if (index === start + 1) {
            sort(a, start + 1, last);
            return
        }
    }
    if (i < j) {
        [a[i], a[j]] = [a[j], a[i]];
        sort(a, start, last);
    } else {
        [a[start], a[j]] = [a[j], a[start]];
        sort(a, start, j - 1);
        sort(a, j + 1, last);
    }
}
```

这个太快了。。。。。。数据越多越有性能优势。