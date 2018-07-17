# Vue2.0之transition组件

`transition`作为标签，其内部的元素被Vue支持其过度属性

### 相关命令

`v-if`

`v-show`

### 相关语法

#### html

```html
<transition>
	<div name="div1">
        div1
    </div>
</transition>
```

`<transition>`中只支持`name`属性

#### CSS

```css
.div1-enter-active, .div1-leave-active {
    
	trasnition: opacity .5s
}
```

`name`属性用于替换Vue钩子函数中的类型`v-` 

- `v-enter`：定义进入过渡的开始状态。在元素被插入时生效，在下一个帧移除。
- `v-enter-active`：定义过渡的状态。在元素整个过渡过程中作用，在元素被插入时生效，在 `transition/animation` 完成之后移除。这个类可以被用来定义过渡的过程时间，延迟和曲线函数。
- `v-enter-to`: **2.1.8版及以上** 定义进入过渡的结束状态。在元素被插入一帧后生效 (与此同时 `v-enter` 被删除)，在 `transition/animation` 完成之后移除。
- `v-leave`: 定义离开过渡的开始状态。在离开过渡被触发时生效，在下一个帧移除。
- `v-leave-active`：定义过渡的状态。在元素整个过渡过程中作用，在离开过渡被触发后立即生效，在 `transition/animation` 完成之后移除。这个类可以被用来定义过渡的过程时间，延迟和曲线函数。
- `v-leave-to`: **2.1.8版及以上** 定义离开过渡的结束状态。在离开过渡被触发一帧后生效 (与此同时 `v-leave` 被删除)，在 `transition/animation` 完成之后移除。

 

 

 