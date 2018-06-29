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
  - `data ` json, 要渲染的数据
    - `message` string, 内容
    - `seen` bool, 可视