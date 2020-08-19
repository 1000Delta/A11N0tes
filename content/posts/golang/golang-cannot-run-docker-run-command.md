---
title: "Golang 无法运行 docker run 命令"
date: 2020-08-19T07:06:53Z
description: ""
tags: [golang, docker, linux]
categories: [golang]
---

在编写博客的 Gitee webhook 服务器时，需要通过 golang 来执行命令，比如 `git pull` 和 `hugo build` 这样的，博客使用的 hugo 命令是通过 Docker 的 `klakegg/hugo` 镜像创建一个用后即删的容器来调用，因此我对于 Docker 容器的调用做了封装，使用 shell 来执行。在测试服务器的过程中，发现对于执行 `hugo build` 命令出现了错误，结果为 `"exit status 1"`，需要找到其中的问题才能顺利运行服务器，自动更新博客内容。

## 测试

### 确定执行命令的用户

我们首先确认 `docker` 命令的可执行权限：

`main.go`:

```go
func main() {
  cmd := exec.Command("whoami")
  output, err := cmd.Output();
  if err != nil {
    log.Printf("RunHugoBuild: command: \"%s\", error: \"%s\"", cmd.String(), err.Error())
  }
  log.Printf("%s", output)
}
```

`stdout`:

```bash
2020/08/19 15:43:29 root
```

通过执行 `whoami`，我们可以确认运行程序的用户是 `root` 并且也确认了命令可以执行。

### 测试能否执行自定义脚本

我们编写一个 `run.sh` 做测试：

```sh
#!/bin/sh

./hugo build
```

替换 `main.go`:

```go
  cmd := exec.Command("./run.sh")
```

测试结果和直接执行 `./hugo build` 是一致的，我们修改脚本内命令为 `whoami`，则能够执行，此时可以确定问题是出在 `./hugo` 脚本中了。

### 直接测试 `./hugo` 中的命令

我们运行 `./hugo build` 实际上在脚本中会被解析成执行以下命令：

```sh
docker run --rm -it -v $(pwd):/src -u $UID:$GID klakegg/hugo build
```

通过 go 来执行这一条命令，果然也是报错 `exit 1`，于是我对这个问题进行了资料查询，只找到在 stackoverflow 上有这样一篇 [Executing docker command using golang exec fails](https://stackoverflow.com/questions/26411594/executing-docker-command-using-golang-exec-fails)

然而文章中的问题，是由于用户没有执行 `docker run` 的权限导致的，因此需要使用 `sh -c sudo` 的方式在 golang 中使用 sudo 来执行 `docker run`，而我测试直接就是在 root 下，原因不一致，实际上使用它的方式来运行结果也没有变化。

### 测试 Docker 命令

接下来就是要对 Docker 命令做测试，首先我们测试其他的 Docker 命令，比如 `docker images`:

```go
  cmd := exec.Command("docker", "images")
```

此时 Docker 命令执行成功，输出了服务器上已经下载的镜像，那么问题就在于 `docker run`。

观察待执行的命令:

```sh
docker run --rm -it -v $(pwd):/src -u $UID:$GID klakegg/hugo build
```

参数中，`--rm` 是停止后自动删除容器，`-v $(pwd):/src` 是指定数据卷，`-u $UID:$GID` 是指定用户为当前用户，避免权限问题，`-it` 表示允许交互（interactive）和创建伪终端（tty）

初步怀疑是参数 `-it` 导致无法使用。

由于我们命令使用了 `$(pwd)` `$UID` 这样的命令调用和环境变量，因此我们通过 `sh -c` 的方式来执行：

```go

const (
  hugoBuildCmd = "docker run --rm -v $(pwd):/src -u $UID:$GID klakegg/hugo build" // 删除 -it 参数
)

cmd := exec.Command("/bin/sh", "-c", hugoBuildCmd)
output, err := cmd.Output()
if err != nil {
  log.Printf("RunHugoBuild: command: \"%s\", error: \"%s\"", cmd.String(), err.Error())
}
log.Printf("%s", output)
```

执行 `go run main.go`，成功了，果然问题就是出在这个参数上。

经过测试，单独使用 `-i` 和 `-t` 均不会导致失败，只有同时使用 `-it` 才会失败。

#### `exec.Command` 的其他情况

##### 直接在命令中包含 `$(pwd)` 这类参数的情况

`main.go`:

```go
cmd := exec.Command("echo", "$(pwd)")
```

`stdout`:

```sh
2020/08/19 20:01:06 $(pwd)
```

使用环境变量也是一样的效果，相当于使用单引号包围参数。

对于我们要执行的命令，如果通过直接使用 docker 命令的方式，将参数分别赋予，会导致无法解析路径而执行出错。

## 原理分析

我们先查看参数的含义：

```sh
 -i, --interactive                    Keep STDIN open even if not attached
 -t, --tty                            Allocate a pseudo-TTY
```


