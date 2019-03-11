# CSS边框渐变

需要使用`border-image`和`border-image-slice`两种属性

```css
div {
    border-image: linear-gradient(0deg, white, black);
    border-image-slice: 10
}
```

`border-image-slice`默认为`100%`，此时只会显示四角的方格