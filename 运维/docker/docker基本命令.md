# docker基本命令

- `docker version` - 查看版本



## 搜索可用的docker镜像

格式：`docker search 镜像名`

```bash
docker search hello-world
```



## 下载镜像

`docker pull 镜像名`

pull时要写完整名字



## 在容器中安装新的程序

`docker run 用户名/镜像名 apt-get -y 程序名`

由于run时运行的程序并不是交互式的，所以必须加上`-y`参数跳过确认



## 保存对容器的修改

`docker commit <id> 用户名/镜像名`

提交时要提交保存容器的ID

使用`docker ps -l`获得容器ID

无需拷贝完整ID，通常开始的三四个字母即可区分



## 运行镜像

`docker run 用户名/镜像名 命令 参数`

运行在容器中的新程序必须run安装后commit保存的镜像



## 检查运行中的镜像

`docker ps` 

查看所有正在运行中的容器列表

`docker inspect <id>`

查看某一个容器的详细信息

输入id前3-4位即可



## 列出所有安装过的镜像

`docker images`





## 发布镜像到官方网站

`docker push 用户名/镜像名`

你只能将镜像发布到自己的空间下面