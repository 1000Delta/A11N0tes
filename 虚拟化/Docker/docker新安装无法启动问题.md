# docker新安装无法启动问题

笔者下载的docker在重启后出现了无法启动的问题，搜索了诸多解决方案，但是没有作用：

1. [docker无法正常启动：Failed to start Docker Application Container Engine](https://blog.csdn.net/qq_35981283/article/details/80857913)
2. [docker重启后启动失败Failed to start Docker Application Container Engine.](https://blog.csdn.net/controllerha/article/details/78828584)

还有一些其他的文章，其中方法包括删除`/var/lib/docker/`, 删除`/var/run/docker.sock`等，都没有作用。

然后沉下心来观察报错：

```shell
11月 15 00:23:54 delta-Lenovo-XiaoXin-700-15ISK systemd[1]: Starting Docker Application Container Engine...
11月 15 00:23:54 delta-Lenovo-XiaoXin-700-15ISK docker[5169]: unknown shorthand flag: 'd' in -d
11月 15 00:23:54 delta-Lenovo-XiaoXin-700-15ISK docker[5169]: See 'docker --help'.
11月 15 00:23:54 delta-Lenovo-XiaoXin-700-15ISK docker[5169]: Usage:        docker [OPTIONS] COMMAND
...
...
...
11月 18 16:15:43 delta-Lenovo-XiaoXin-700-15ISK systemd[1]: Failed to start Docker Application Container Engine.
11月 18 16:15:45 delta-Lenovo-XiaoXin-700-15ISK systemd[1]: docker.service: Service hold-off time over, scheduling restart.
11月 18 16:15:45 delta-Lenovo-XiaoXin-700-15ISK systemd[1]: docker.service: Scheduled restart job, restart counter is at 3.
11月 18 16:15:45 delta-Lenovo-XiaoXin-700-15ISK systemd[1]: Stopped Docker Application Container Engine.
11月 18 16:15:45 delta-Lenovo-XiaoXin-700-15ISK systemd[1]: docker.service: Start request repeated too quickly.
11月 18 16:15:45 delta-Lenovo-XiaoXin-700-15ISK systemd[1]: docker.service: Failed with result 'exit-code'.
11月 18 16:15:45 delta-Lenovo-XiaoXin-700-15ISK systemd[1]: Failed to start Docker Application Container Engine.
11月 18 16:16:16 delta-Lenovo-XiaoXin-700-15ISK systemd[1]: docker.service: Start request repeated too quickly.
11月 18 16:16:16 delta-Lenovo-XiaoXin-700-15ISK systemd[1]: docker.service: Failed with result 'exit-code'.
11月 18 16:16:16 delta-Lenovo-XiaoXin-700-15ISK systemd[1]: Failed to start Docker Application Container Engine.
...
```

观察第一个报错：

```shell
11月 15 00:23:54 delta-Lenovo-XiaoXin-700-15ISK docker[5169]: unknown shorthand flag: 'd' in -d
```

猜想是.service文件配置`ExecStart=`错误，于是打开默认文件:

```shell
vim \lib\systemd\system\docker.service
```

执行的命令为`dockerd -D -H unix:///var/run/docker/docker.sock`，并没有错误，而且报错的命令为`docker`而不是`dockerd`更是让人不解，但是没有解决方法，继续往下看：

```shell
11月 18 16:15:45 delta-Lenovo-XiaoXin-700-15ISK systemd[1]: docker.service: Start request repeated too quickly.
```

重启过快的问题，于是想到修改.service配置文件的重启时间，想到直接修改.service文件如果出错不好复原，于是使用`systemctl edit`命令编辑覆盖执行的配置文件：

```shell
systemctl edit docker.service
```

这时候，重点来了。。。在打开的配置文件里，出现了这么两句：

```
[Service]
ExecStart=
ExecStart=/usr/bin/docker -d -H fd:// --registry-mirror=https://docker.mirrors.ustc.edu.cn
```

我的天。。。问题就在这里，这两句的执行覆盖了默认设置，而可能是Docker在某次更新中取消了`-d`选项，而改用`dockerd`来启动daemon进程，而apt中还存储了这个配置，导致启动失败。。。最坑的是此前我曾在`/lib/systemd/system/`中搜索过`docker.service.d`文件夹而没找到，但是却存在这样一个配置文件。。。于是修改为：

```
[Service]
ExecStart=
ExecStart=/usr/bin/dockerd -D -H tcp://127.0.0.1:2376 --registry-mirror=https://docker.mirrors.ustc.edu.cn
```

成功启动。

Notice：

- 在此处，`-H`参数 `tcp://127.0.0.1:2376`也可以使用unix套接字替换：`unix:///var/run/docker.sock`