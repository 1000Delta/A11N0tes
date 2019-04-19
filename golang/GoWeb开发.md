# Go Web开发

## 使用http包建立Web服务器

### 分发路由

```go
http.HandleFunc("/", funcName)
```

建立指定路径的路由并由指定函数进行处理，要求函数参数

```go
func funcName(w http.ResponseWriter, r *http.Request) {
    // do something
}
```

其中参数`w`是调用时创建的响应写入器，数据较少，因此直接传递对象即可，而传入的请求包含用户传递的数据，直接传值开销较大，因此传递结构体的指针。

#### 请求数据获取

```go
func funcName(w ResponseWriter, r *http.Request) {
    fmt.Println(r.Form) // 用户传递的参数
    ...
}
```

更多请求数据参考[标准库](https://studygolang.com/static/pkgdoc/pkg/net_http.htm#Request)

#### 对请求进行响应

```go
func funcName(w ResponseWriter, r *http.Request) {
    ...
    fmt.Fprintf(w, "Response Content")  //将输出直接响应到客户端
}
```

### 监听端口

```go
err := http.ListenAndServe(":9090", nil)
if err != nil { // 错误处理
    ...
}
```

监听TCP地址`9090`，并且使用第二个参数制定的`Handler`参数调用Serve函数处理收到的连接。设为`nil`时使用DefaultServeMux.



