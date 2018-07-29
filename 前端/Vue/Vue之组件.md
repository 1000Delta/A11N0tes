## 组建注册

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



