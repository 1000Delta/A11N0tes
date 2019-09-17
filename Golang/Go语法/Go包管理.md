# golang包管理

## 导入 import

```go
import [NAME] "importpath"
```

如果使用了`NAME`会以其为包名，从`$GOPATH/src`或者`$GOROOT/src`导入包

## init 函数

在任何包中都可以有0个或多个init函数

init 函数不能被显式调用

## 导入包流程

首先初始化导入包的变量和常量，然后执行`init`函数，最后是main函数（main包）