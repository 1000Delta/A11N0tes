# Dockerfile的编写

与git类似，对于项目中要排除的文件，在项目的根目录下新建一个文本文件`.dockerignore`，写入你要排除的文件/目录。

## 创建Dockerfile

### 相关命令

- `FROM image:tag` 表示该image继承自某个image的某个tag
- `COPY path1 path2` 将path1下的所有文件（除了.dockerignore排除的路径），都拷贝进入image文件的/app目录
- `WORKDIR path` 制定path为接下来的工作目录
- `RUN ...` 运行某项命令，运行结果会打包进image中
- `EXPOSE <port>` 将某个端口暴露到容器外部



## 创建image文件

`docker image build`

- `-t name[:tag]` 指定image文件的名字，后面可以使用冒号制定标签.如果不指定,默认的标签就是`latest`

例:

```bash
docker image build -t koa-demo .
```

文件最后面那个点表示**dockerfile文件所在的路径**

