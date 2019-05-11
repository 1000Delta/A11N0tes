# Beego 学习

## 路由

- Restful函数式路由：使用`beego.Router()`函数将控制器直接传入，然后通过直接调用其绑定方法（`.Get(), .Post()`）等限制访问

## 静态文件

- 静态目录别名：`beego.SetStaticPath(alias, path string)`

## 请求 & 响应

- 如果你的 BeforeRouter 过滤器用到了 session 就会报错，你应该把它加入到 AfterStatic 过滤器中。

## 参数配置

- 使用`beego.AppConfig.string(key string)`来获取已配置的参数
- 使用`[]`在配置文件中划分出不同模式（`runmode`），使用`mode::key`来指定不同模式的参数
- 从环境变量中获取配置项：`${env||value}` 如果环境变量存在则使用环境变量，否则使用`value`