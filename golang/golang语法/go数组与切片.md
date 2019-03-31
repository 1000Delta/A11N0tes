# Go 数组与切片

数组是一种常见的线性数据结构。在Go语言中，数组的长度不可改变。

>数组是具有相同唯一类型的一组已编号且长度固定的数据项序列，这种类型可以是任意的原始类型例如整形、字符串或者自定义类型。  ——菜鸟教程

Go语言中切片是对数组的抽象，采用可变长度，也可以叫做“动态数组”。

## 声明

```go
// 声明数组
var array_name [SIZE] variable_type

// 声明切片
var slice_name []type  // 通过声明一个未指定大小的数组来定义切片
var slice1 []type = make([]type, len) // 使用make()创建切片
slice1 := make([]type, len) // 简写
make([]T, length, capacity) // 指定容量
```



切片定义时不需要说明长度

## 通过数组创建切片

```go
slice := array[start:end]
```

将会截取从`start`到`end`-1指定的数组元素组成切片

