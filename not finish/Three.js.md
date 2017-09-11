# Three.js

### 3个要点，场景和相机和渲染

#### 场景

`let scene=new THREE.Scene()`

场景没什么特别的，暂时只需要 

`scene.add(Object)`

#### 相机

`let camera=new THREE.PerspectiveCamera()`

参数的解释。

第一个参数是视角，越大，看到的越小，70多就好了

第二个参数是是宽长比，w/h

第3个和第4个参数是进切面，远切面

#### 渲染

`let renderer=new Three.WebGLRenderer()`

设置渲染的大小

`renderer.setSize(w,h)`

render有一个domElemet属性，这个属性可以渲染到网页页面上

`document.body.appendChild(renderer.domElement)`

 开始渲染

`renderer.render(scene,camera)`

### 怎么编写

定义场景

首先需要在定义相机的过程中设置他的属性

其次renderer需要去setSize(w,h),设置他的宽高

之后在dom树里面加入元素

再生成场景元素

之后在scene里面加入场景元素

***

这里我写了一个模板

```javascript
import * as T from "three";
function init(tag = document.body) {
  let [w, h] = [window.innerWidth, window.innerHeight];
  const scene = new T.Scene();
  const camera = new T.PerspectiveCamera(75, w / h, 0.1, 1000);
  const renderer = new T.WebGLRenderer();
  renderer.setSize(w, h);
  let domElement = tag;
  tag.appendChild(renderer.domElement);
  return {
    scene,
    camera,
    renderer
  };
}

function createObject() {
  let object = new T.Mesh(
    new T.CubeGeometry(1, 2, 3),
    new T.MeshBasicMaterial({
      color: 0xf0f0f1,
      opacity: 0.77
    })
  );
  return object;
}

function run() {
  const { scene, camera, renderer } = init();
  const object = createObject();
  scene.add(object);
  camera.position.z = 7;
  function draw() {
    camera.position.x += 0.01;
    camera.position.y += 0.01;
    renderer.render(scene, camera);
  }
  return draw;
}

let render = run();

render();

```

**上面代码是规范后的实现，还是很直观的**

***

### 场景的物体

#### 长方体

`CubeGeometry`

Mesh一个长方形元素

```javascript
new THREE.Mesh(new THREE.CubeGeometry(x,y,z),new MeshBasicMaterial({
    color:0x00ffff,
  	opacity:0.77
}))
```

#### 平面

`PlaneGeometry(x,y)`