# docker发布image

首先,在docker中登录

```bash
$ docker login
```

为本地的image标注用户名和版本

```bash
$ docker image tag [imagename] [username]/[repository]:[tag]
```

也可以不标注用户名，重新**构建 image 文件。**

```bash
$ docker image build -t [username]/[repository]:[tag] .
```

最后发布image文件

```bash
$ docker image push [username]/[repository]:[tag]
```

