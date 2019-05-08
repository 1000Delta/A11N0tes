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