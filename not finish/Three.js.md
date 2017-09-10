# Three.js

### 3个要点，场景和相机和渲染

#### 场景

`let scene=new THREE.Scene()`

#### 相机

`let camera=new THREE.PerspectiveCamera()`

#### 渲染

`let renderer=new Three.WebGLRenderer()`

render有一个domElemet属性，这个属性可以渲染到网页页面上



Three.js的特色就是可以先将domElement渲染到dom树里面。之后动态添加元素进去

`scene.add(Object)`

### 怎么编写

定义场景

首先需要在定义相机的过程中设置他的属性

其次renderer需要去setSize(w,h),设置他的宽高

之后在dom树里面加入元素

再生成场景元素

之后在scene里面加入场景元素

***

关于场景可以等以后再去关心，先看点线面的定义：

#### 一个矢量

`Three.Vector(x,y,z)`

`let vector1=new Three.Vector();vector1.set(x,y,z)`

