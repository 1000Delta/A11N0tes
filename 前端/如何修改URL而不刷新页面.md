# 如何修改URL而不刷新页面

## MDN文档

https://developer.mozilla.org/zh-CN/docs/Web/API/History_API

## 概述

在使用ajax进行网页的部分更新时，URL同时变化能让页面更加好看，并且显示为类似与直接加载页面的效果。

在HTML中使用`window`对象的`history`属性能实现对页面历史的操作，包括前进、后退、跳转，在HTML5中提供了对`history`栈的操作。

## `window.history`相关操作

```javascript
// HTML
window.history.back() // 后退历史
window.history.forward() // 前进历史
window.history.go(1) // 跳转到history栈中当前页面的相对位置为指定值的页面

// HTML5
window.history.pushState(Obj, title, url) // 向history栈中写入新状态
window.history.replaceState(obj, title, url) // 替换当前页面状态
```

- `obj` 状态对象，用于存储页面历史状态的数据，比如可以用于存放访问后端时需要调用的参数或者api地址，然后重写`popstate`方法来在浏览器历史操作时访问`state`中指定的资源
- `title` 标题，暂时没用，建议使用空字符串避免api变更时受影响
- `url` 历史的url，可选参数，默认为当前页面地址。会显示在地址栏，我们使用它就可以进行页面地址的变更

