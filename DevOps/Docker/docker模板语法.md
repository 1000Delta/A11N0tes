# Docker模板语法

## inspect 相关

查看容器映射路径

```sh
docker inspect -f {{.HostConfig.Binds}} CONTAINER
```

