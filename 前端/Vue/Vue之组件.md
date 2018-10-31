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

### 通过Porps传值到子元素

通过在组件元素上对自定义元素设置值来传递值到子元素

## 向上传值

通过事件可以将值抛出到组件之外被父级元素接收到：

```vue
<template>
	<div v-on:click="$emit('new-action', 1)">
    </div>
</template>
<script>
    export default {
        data () {
            reboot
        },
    }
</script>
<style scoped>
    div {
        width: 100px;
        height: 100px;
        background-color: 
    }
</style>
```

父级：

```html
<html>
    <head>
        <title>test</title>
    </head>
    <script type="text/javascript">
    	Vue.component('example', require('./example.vue'));
        new Vue({
            el: 'html',
            method: {
                nA() {
                    alert('New action');
                }
            }
        })
	</script>
    <body>
        <example v-on:new-action="nA"></example>
    </body>
</html>
```

