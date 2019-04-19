# Go Module 模块

> 内容摘自 https://colobu.com/2018/08/27/learn-go-module/

在Go1.11中新加入了一个特性：模块（module）

使用的基本命令为`go mod`

使用go module 能让你摆脱golang原有的包管理，将项目放在任意的路径，使用module来添加依赖的模块

## 使用

使用`go module`的首要步骤就是加入环境变量`GO111MODULE=true`

### 创建一个新的项目

使用命令

```shell
go mod init pkgname
```

可以创建一个空的go.mod，然后你可以在其中增加依赖比如

```
require github.com/smallnest/rpcx latest
```

或者由go自动发现和维护

### 管理项目

对于已经创建了`go.mod`的项目， 可以通过`go get ./..`让他查找依赖。

通过`go mod tidy`可以为`go.mod`调整依赖

## `go mod` 命令

| 命令 | 含义 |
| ---- | ---- |
|download|download modules to local cache (下载依赖的module到本地cache))|
|edit|edit go.mod from tools or scripts (编辑go.mod文件)|
|graph|print module requirement graph (打印模块依赖图))|
|init|initialize new module in current directory (再当前文件夹下初始化一个新的module, 创建go.mod文件))|
|tidy|add missing and remove unused modules (增加丢失的module，去掉未用的module)|
|vendor|make vendored copy of dependencies (将依赖复制到vendor下)|
|verify|verify dependencies have expected content (校验依赖)|
|why|explain why packages or modules are needed (解释为什么需要依赖)|

## 翻墙

防止国内访问不到`golang.org/x`的各个包，在`go.mod`中写入`replace`语句将其替换成github上的相应库。

```
replace (
	golang.org/x/crypto v0.0.0-20180820150726-614d502a4dac => github.com/golang/crypto v0.0.0-20180820150726-614d502a4dac
	golang.org/x/net v0.0.0-20180821023952-922f4815f713 => github.com/golang/net v0.0.0-20180826012351-8a410e7b638d
	golang.org/x/text v0.3.0 => github.com/golang/text v0.3.0
)
```

