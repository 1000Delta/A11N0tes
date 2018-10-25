# Vue 类

## 声明对象

```javascript
// 有多个 Vue 对象时
var app = new Vue({
  el: '#app',
    data: {
        message: 'Hello vue!'
    }
})
// 单个 Vue 对象（根对象）
new Vue({
    el: ''
})
```

参数：

- json数组
  - `el` string, 绑定的元素
  - `data `  属性，通常下为固定值
  - `computed`  计算属性
  - `methods` 方法
  - `watch` 监听属性 

## 内建方法

### `vm.$emit( eventName, […args] )`

- 参数
  - `eventName` 事件名
  - `[...args]` 附加参数，传给监听器回调
- 作用
  - 从子组件向父级触发事件
    - 在父组件触发的事件中，可以通过`$event`来调用**附加参数**