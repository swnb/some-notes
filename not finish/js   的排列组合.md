# js   的排列组合

### 排列组合的定义

组合：从一组数据中提取出一定数目的数据，不排序，求有多少种可能性

排序，在取出数据的同时进行排序，问有多少种可能性

下面的代码都是可以选可重复元素的，不可重做一个数组去重就可以了

### 组合的实现函数

比较复杂

```javascript

```



### 排序的实现函数

```javascript
// 测试样本
arr = [1, 2, 3, 4];

//将所有结果整合成为数组
let result = [];

function Arrange(arr, str = "") {
  if (arr.length === 0) {
    //如果没有元素了，就输出组合的字符串
    result.push(str);
  } else {
    //遍历数组的对象
    arr.forEach((value, index) => {
      //复制字符串和数组
      let str_copy = str + value;
      let arr_copy = [...arr];
      //清除复制的数组中被拼入字符串的元素
      arr_copy.splice(index, 1);
      //再进行组合
      Arrange(arr_copy, str_copy);
    });
  }
}

//测试代码
Arrange(arr);
//输出结果
console.log(result);
```

但是上面的代码有改进的余地

* 可以用解构去生成复制的元素
* 只要数组剩一个元素了就可以跳出递归

我们来改进下

```javascript
function Arrangement(arr) {
  let result = [];
  function Arrange(arr, str = "") {
    if (arr.length === 1) {
      //如果没有元素了，就输出组合的字符串
      result.push(str + arr[0]);
    } else {
      //遍历数组的对象
      arr.forEach((value, index) => {
        //复制字符串和数组
        let [str_copy, arr_copy] = [str + value, [...arr]];
        //清除复制的数组中被拼入字符串的元素
        arr_copy.splice(index, 1);
        //再进行组合
        Arrange(arr_copy, str_copy);
      });
    }
  }
  return result
}
```

上面的代码输出的是组合数组



