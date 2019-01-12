# docker守护程序配置

核心命令：

```shell
dockerd [-D -H tcp://127.0.0.1:2376]
```

`tcp://127.0.0.1:2376` 为指定的连接方式，也可使用UNIX套接字：

`unix:///var/run/docker.sock`等

选项：

- `-D` 开启DEBUG模式
- `-H` hosts, 主机URI

在命令中跟随的选项可以使用配置文件`/etc/docker/daemon.json`指定：

```json
{
    "debug": true,
    "hosts": {
        "tcp://127.0.0.1:2376"
    }
}
```

