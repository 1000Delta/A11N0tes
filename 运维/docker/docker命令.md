# docker命令

## run

```bash
docker run ubuntu
```

创建一个容器, 并且启动到运行时容器

相当于 `docker create` + `docker start`

### 选项

`-h <hostname>` 设定主机名

`-i` 交互式

`-t` tty

`--name` 制定容器的名称，不指定时由随机的一个形容词和一个著名的科学家/工程师/黑客的名字组成

## start

## search

## pull

## commit

## push

## ps

## container

### kill

### stop

### ls

### rm

## inspect

```bash
$ docker inspect <ID|name> 
```

### 选项

`--format <attribute>` 过滤信息（需要使用Go模板）

## images

## image





