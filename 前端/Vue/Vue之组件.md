## 组件注册

组件注册分为局部注册与全局注册两种，形式上很相似

```javascript
/* 全局注册 */
Vue.component('component-name', {
    template: '<div></div>'
})
/* 局部注册 */
new Vue({
    // ...
    components: {
        'component-name': {
            template: '<div></div>'
        }
    }
})
```

## data

Vue的`data`属性必须是一个函数，返回其所需的参数的json对象，否则组件将共享同一组数据

## Prop

`props`中存放自定义属性的名称

### 自定义属性

可以用于传递数据