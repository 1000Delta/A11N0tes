# golang语法

## 延迟执行语句 defer

`defer`关键字可以是的其操作的语句延迟执行，便于简化代码，将代码结构与语句执行顺序相分离，避免相关逻辑分散而影响代码可读性。

`defer`延迟的语句将会到所属的函数作用域结束时执行。

同一函数内多条`defer`语句的执行顺序：LIFO

## 接口 Interface 与类型 Type

在Go中，接口与类型在不使用时是完全不耦合的

## 自定义错误信息

使用`errors`包可以进行自定义错误信息

语法：

```go
errors.New("This is a Error")
```

## 使系统宕机 panic

```go
panic("Error Info")
```

## 并发 goroutine 与通信管道 channal

使用`go`关键字与`chan`关键字

