# Go 结构体

## 内嵌结构体

内嵌结构体可以使当前结构体立即拥有被嵌入的结构体的所有属性和方法。

以Beego的控制器（`Beego.Controller`）为例：

```go
package controllers

import (
	"github.com/astaxie/beego"
)

type MainController struct {
    beego.Controller
}
```

如上，在结构体内添加指定结构体即完成结构体的嵌入。

## 结构体标签 struct tag

在结构体内使用字符串字面量来表示

在使用反射时可以使用，反射的包让我们在运行时获取到变量的类型，属性以及方法，也可以得到结构体的tag

```go
package main

import (
    "fmt"
    "reflect"
)

type TagType struct {
    field1 bool    "An important answer"
    field2 string  "The name of the thing"
    field3 int     `how much there are`
}

func main() {
    tt := TagType{true, "Barak Obama", 1}
    var reflectType reflect.Type = reflect.TypeOf(tt)
    var ixField reflect.StructField
    for i := 0; i < 3; i++ {
        ixField = reflectType.Field(i)
        fmt.Printf("%s\n", ixField.Tag)
    }   
}
// 代码摘自https://www.jianshu.com/p/d396f86c8583
```

### 在结构体转换中

结构体转换到json的过程中，可以使用tag来指定其转换后的变量名：

```go
type Result struct {
    Code   int         `json:"code,omitempty" `
    Msg    string      `json:"msg,omitempty" `
    Detail string      `json:"detail,omitempty" `
    Data   interface{} `json:"data,omitempty" `
}
// 代码来自云片网golang sdk
```

