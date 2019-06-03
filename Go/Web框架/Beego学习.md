# Beego 学习

## 路由

```go
package routers

// init() ..
```



- **Restful函数式路由**：使用`beego.Router()`函数将控制器直接传入，然后通过直接调用其绑定方法（`.Get(), .Post()`）等限制访问
  - 最简单的路由**传入闭包**即可，闭包参数类型`*context.Context`
  - **传入控制器**需要传入其指针类型，例：`beego.Router("/", &controllers.MainController{})`
    - 使用**自定义函数名**：在路由中指定第三个参数，string类型，格式为`"httpmethod[,httpmethod]:function[;httpmethod:function]"`，可以指定将不同的http方法调用同一个函数
  - **正则路由**，框架实现了部分简化自动替换 https://beego.me/docs/mvc/controller/router.md#%E6%AD%A3%E5%88%99%E8%B7%AF%E7%94%B1

## 静态文件

- 静态目录别名：`beego.SetStaticPath(alias, path string)`

## 请求 & 响应

- 如果你的 BeforeRouter 过滤器用到了 session 就会报错，你应该把它加入到 AfterStatic 过滤器中。

## 参数配置

- 使用`beego.AppConfig.string(key string)`来获取已配置的参数
- 使用`[]`在配置文件中划分出不同模式（`runmode`），使用`mode::key`来指定不同模式的参数
- 从环境变量中获取配置项：`${env||value}` 如果环境变量存在则使用环境变量，否则使用`value`

## 控制器

控制器结构：

```go
package controllers

import (
	"github.com/astaxie/beego"
)

type MainController struct {
    beego.Controller
}

// Get
func (v *MainController) Get() {
    // do
}
```



- 实现控制器只需匿名引入`beego.Controller`
- 信息验证：实现`Prepare`方法，并在其中加入验证
  - **提前终止运行**：`StopRun`方法
    - 如果调用了`StopRun`将不会调用`Finish`，如果有资源需要释放，在终止之前手动调用`Finish`
- PUT 接收表单 [在表单中使用PUT方法](https://beego.me/docs/mvc/controller/controller.md#%E5%9C%A8%E8%A1%A8%E5%8D%95%E4%B8%AD%E4%BD%BF%E7%94%A8-put-%E6%96%B9%E6%B3%95)
- 直接输出文本在方法中使用`this.Ctx.WriteString`

## 模板

- 模板文件/文件夹名必须小写