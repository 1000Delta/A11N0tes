---
title: Protobuf 基础
date: 2020-10-28
lastmod: 2020-11-04
tags: [Protobuf, RPC]
# image: "/image/blog-pic.jpg"
---

## 数据类型

### 特殊数据类型

|   类型    |                               描述                               |
| :-------: | :--------------------------------------------------------------: |
| `message` |       描述一个请求或响应的消息格式，可以包含多种类型的字段       |
| `service` | 定义一个 RPC 服务接口，protoc 编译器可以根据定义生成服务接口代码 |

### 定义一个简单的服务

`hello.proto`:

```protobuf
message HelloRequest {
    string name = 1;
}

message HelloResponse {
    string msg = 1;
}

service HelloService {
    rpc SayHello (HelloRequest) returns (HelloResponse) {}
}
```

#### 代码生成

使用 `protoc` 编译器可以根据 `.proto` 文件生成各个语言的代码，比如生成 Golang 代码：

```bash
protoc --go_out=. hello.proto
```

其中，参数 `--go_out=.` 表示使用名为 `protoc-gen-go` 的工具（`--XX_out` 对应于 `protoc-gen-XX`），在相对于 `proto` 文件为 `.` 的路径下生成后缀为 `.pb.go` 的代码。

生成代码之后，我们可以看到对于我们定义的 `message` 生成的 `struct`：

```go
// ...

type HelloRequest struct {
	Name                 string   `protobuf:"bytes,1,opt,name=name,proto3" json:"name,omitempty"`
	XXX_NoUnkeyedLiteral struct{} `json:"-"`
	XXX_unrecognized     []byte   `json:"-"`
	XXX_sizecache        int32    `json:"-"`
}

// ...

type HelloResponse struct {
	Msg                  string   `protobuf:"bytes,1,opt,name=msg,proto3" json:"msg,omitempty"`
	XXX_NoUnkeyedLiteral struct{} `json:"-"`
	XXX_unrecognized     []byte   `json:"-"`
	XXX_sizecache        int32    `json:"-"`
}

// ...
```

并且还生成了一系列方法，用于实现 `proto.MessageV1` 接口。

可以发现，代码中是没有 `service` 相关的定义的，因为 RPC 的框架有很多，`protoc` 编译器并不能确定你用的是哪一种；但是 `protoc-gen-go` 默认提供了 GRPC 插件，可以生成针对 GRPC 的服务代码。

我们可以针对 Golang 的 `net/rpc` 库定制 `service` 的 `protoc` 生成代码插件，使用 `net/rpc` 来进行通信，步骤可以参考 [Go 语言高级编程 4.2.2 定制代码生成插件](https://books.studygolang.com/advanced-go-programming-book/ch4-rpc/ch4-02-pb-intro.html#422-%E5%AE%9A%E5%88%B6%E4%BB%A3%E7%A0%81%E7%94%9F%E6%88%90%E6%8F%92%E4%BB%B6)。

上述生成的代码使用的是 `net/rpc` 默认的编解码器，使用的是 Golang 专属的 gob 编码，无法做到 Protobuf 应该做到的语言无关特性，而官方库 `github.com/golang/protobuf/proto` 只提供了 `proto.Marshal`/`proto.Unmarshal` 两个编解码方法，而没有针对 `net/rpc` 的编解码器，我们可以采用 `github.com/mars9/codec` 或者自行定制 codec。对于 codec 相关的 Protobuf 代码生成，可以参考[示例](https://github.com/1000Delta/gopractice/blob/9cd81cc3dbb8e653df9468e57cc0bb25f95bf840/learngopkg/protobuf/protoc-gen-go-netrpc/netrpc.go.tmpl#L30-L36)。
