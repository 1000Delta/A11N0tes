# PHP面向对象(三) 命名空间

命名空间在面向对象编程中是很重要的一部分，PHP 5.3版本开始也支持命名空间（namespace）了。

命名空间用来解决一个在面向对象编程中很常见的问题：

> 随着我们开发越来越多的类，包括我们包含进代码的其他开发者或者第三方库中的类，如果引用的类库中出现同名的类，就会产生冲突。

命名空间让我们能对类进行分组, 方便我们对指定类的调用与管理.

## 使用方法

### 指定命名空间

我们使用`namespace`关键字来指定命名空间