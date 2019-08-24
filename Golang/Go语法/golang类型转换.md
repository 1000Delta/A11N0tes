# golang 类型转换

## 类型转换

可以进行基本类型转换，使用`type(variable)`即可

`string`类型只能和`[]byte`进行转换

`interface{}`类型只能通过**类型断言**来获取指定类型的值。

## Comma-ok断言

对于`interface{}`类型变量而言，我们只能通过类型断言来获取指定类型的值，在golang中通常使用Comma-ok断言来进行获取，防止断言失败导致panic。

```go
var iData interface{} = 1
data, ok := iData.(int)
if ok {
    // 获取成功
}
```



