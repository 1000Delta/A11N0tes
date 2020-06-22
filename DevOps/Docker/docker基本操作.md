# docker基本操作

- `docker version` - 查看版本




## 镜像操作

### 搜索可用的docker镜像

格式：`docker search 镜像名`

```bash
docker search hello-world
```

选项：

- `-f --filter filter` 过滤输出内容
- `--format string` 格式化输出内容
- `--limit int` 限制输出结果，默认为25个
- `--notrunc` 不截断输出结果  



### 下载镜像

`docker pull 镜像名`

pull时要写完整名字



### 列出所有安装过的镜像

`docker images`

`docker image ls`



### 删除镜像

`docker rmi IMAGE[ IMAGE...]`

`docker image rm IMAGE[ IMAGE...] `

其中`IMAGE`可以为标签或ID

选项：

- `-f -force` 强制删除镜像，即使有容器依赖它
- `-no-prune` 不要清理未带标签的父镜像



### 发布镜像到官方网站

`docker push 用户名/镜像名`

你只能将镜像发布到自己的空间下面



## 容器操作

### 在容器中安装新的程序

`docker run 用户名/镜像名 apt-get -y 程序名`

由于run时运行的程序并不是交互式的，所以必须加上`-y`参数跳过确认



### 保存对容器的修改

`docker commit <id> 用户名/镜像名`

提交时要提交保存容器的ID

使用`docker ps -l`获得容器ID

无需拷贝完整ID，通常开始的三四个字母即可区分



### 生成容器

`docker run [options] 用户名/镜像名 [命令 [命令参数]] `

从image文件，生成一个正在运行的容器实例。

`docker run` 相当于执行了两步操作, 将镜像放入容器中(`docker create`), 然后将容器启动(`docker start`), 使之变成运行时容器.

*`docker container run`命令有自动抓取镜像文件的功能，如果发现本地没有指定的image文件，就会从仓库自动抓取*

运行**在容器中的新程序**必须run安装后commit保存的镜像



### 启动容器

`docker container start [containerID]`



### 检查运行中的容器

`docker ps` 

`docker container ls`

查看所有正在运行中的容器列表

`docker ps --all`

`docker container ls --all`

列出本机所有容器，包括终止运行的容器

`docker inspect <id>`

查看某一个容器的详细信息

输入id前3-4位即可



### 终止运行中的容器

`docker container kill [containerID]`

相当于向容器里的主线程发出SIGKILL信号.

`docker container stop`

相当于向容器里面的主线程发出SIGTERM信号,过一段时间再发出SIGKILL信号.



容器停止后并不会消失,用下面的命令删除容器文件



### 删除容器文件

`docker container rm [containerID]`



