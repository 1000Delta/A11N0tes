# Beego 学习

## 路由

- 路由使用`beego.Router()`函数将控制器直接传入，然后通过直接调用其绑定方法（`.Get(), .Post()`）等限制访问

## 静态文件

- 静态目录别名：`beego.SetStaticPath(alias, path string)`

## 请求 & 响应

- 如果你的 BeforeRouter 过滤器用到了 session 就会报错，你应该把它加入到 AfterStatic 过滤器中。

