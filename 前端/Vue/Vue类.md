# Vue 类

## 声明对象

```javascript
var app = new Vue({
  el: '#app',
    data: {
        message: 'Hello vue!'
    }
})
```

参数：

- json数组
  - `el` string, 绑定的元素
  - `data `  属性，通常下为固定值
  - `computed`  计算属性
  - `methods` 方法
  - `watch` 监听属性 