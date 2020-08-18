

# go-micro 学习记录

安装

按照 [Running a service](https://dev.m3o.com/getting-started#running-a-service) 中运行服务进行测试

​	在执行 `micro run helloworld` 时出现报错：

```
runtime Error processing create event for service helloworld:latest in namespace go.micro: fork/exec /opt/go/bin/go: no such file or directory
```

到官方仓库去查找 heloworld 服务，在 [examples/helloworld](https://github.com/micro/examples/tree/master/helloworld) 中有相关的使用方法，按照方法操作，执行生成（Generate）操作会在当前目录下生成 `github.com/micro/services/helloworld` 文件夹。

安装依赖后，按照 [Usage](https://github.com/micro/examples/tree/master/helloworld#usage) 即可使用，服务发现机制会自动将服务注册到运行的 micro server 中。

发现教程文本错误太多，找到了另一个官方文档 [Running a service](https://m3o.com/docs/getting-started.html#running-a-service)

编写一个新服务：`micro new <path>`

更新运行中的服务：`micro update <path>`

 ## 新服务模板

使用命令创建名称为 `foobar` 的服务

```bash
$ micro new foobar
```

创建成功后会返回信息：

```bash
Creating service go.micro.service.foobar in asdasd

.
├── main.go
├── generate.go
├── plugin.go
├── handler
│   └── foobar.go
├── subscriber
│   └── foobar.go
├── proto
│   ├── foobar
│   │   └── foobar.proto
│   └── imports
│       └── api.proto
├── Dockerfile
├── Makefile
├── README.md
├── .gitignore
└── go.mod


download protoc zip packages (protoc-$VERSION-$PLATFORM.zip) and install:

visit https://github.com/protocolbuffers/protobuf/releases

download protobuf for micro:

go get -u github.com/golang/protobuf/proto
go get -u github.com/golang/protobuf/protoc-gen-go
go get github.com/micro/micro/v2/cmd/protoc-gen-micro

compile the proto file foobar.proto:

cd foobar
make proto
```

### 项目文件介绍

在创建项目的反馈中有项目文件结构

#### Makefile

Makefile 定义了几个需要使用到的构建命令：

- `make proto` 根据 `proto/foobar/foobar.proto` 生成protobuf接口代码
- `make build` 编译服务应用
- `make test` 执行服务中的测试 `*_test.go`
- `make docker` 构建服务的 Docker 镜像

如果不理解 Makefile 的结构和 “伪目标” 等概念，可以参考阮一峰的 [Make 命令教程](http://www.ruanyifeng.com/blog/2015/02/make.html)

#### Dockerfile 

构建 Docker 服务镜像的脚本。

基于 Alpine 发行版 Linux ，将服务二进制拷贝到根目录，然后将入口点设置为前台运行服务。

