# Android XML 标签

## 标签

> 格式:
>
> - `<tag></tag>` [...]
>   - `attr` [...]

### 视图

- `<LinearLayout></LinearLayout>` 用于放置水平或垂直方向的子视图部件
  - `android:orientation` 决定放置方向
- `<EditText></EditText>` 

### 配置

- `<application></application>`
  - `<activity></activity>`

## 属性

> 在属性中引用资源对象时, 必须使用`@`符号, 紧随@之后的时资源的类型, 然后是资源的名字

### 视图

- `android:id` id
- `android:layout_width` 宽度
- `android:layout_height` 高度
- `android:layout_weight` 权重, 空间将按照权重的值分配给同级部件; View的默认权重为0, 如果只有一个部件的权重大于0, 则该View将占去除别的View本身占据的空间的所有空间
- `android:hint` 文本框为空时显示的字符串
- `android:text`
- `android:onClick` 点击时调用指定方法

### 配置

- `android:name`
- `android:label`
- `android:parentActivityName` 声明了在应用程序中该Activity逻辑层面的父类Activity的名称. 系统用此值来实现默认导航操作.