# Elasticsearch报错修复

## 系统设置

```bash
[1]: max file descriptors [65535] for elasticsearch process is too low, increase to at least [65536]
[2]: max virtual memory areas vm.max_map_count [65530] is too low, increase to at least [262144]
```

1. max file descriptors 过小

   为最大文件描述符，设置其大于65535即可，修改`/etc/security/limits.conf` 添加：

   ```
   *	-	nofile	65536
   *	-	memlock	unlimited
   ```

2. max_map_count 过小

   max_map_count限制了一个进程可以拥有的VMA的数量，系统默认是65530，修改成262144。修改`/etc/sysctl.conf`：

   ```
   vm.max_map_count=262144
   ```

   然后执行：

   ```bash
   sysctl -p
   ```

   也可以直接执行

   ```shell
   sysctl -w vm.max_map_count=262144
   ```

   


## can not run elasticsearch as root

创建新用户和用户组并切换文件所有者

 

```
OpenJDK Server VM warning: Cannot open file logs/gc.log due to Permission denied
```

使用root启动过导致创建的日志文件为root权限，删除相关文件即可。

## system call filters failed to install; check the logs and fix your configuration or disable system call filters at your own risk

在Elasticsearch根目录下`config/elasticsearch.yml`文件中，配置:

```yml
bootstrap.system_call_filter: false
# memory段下
bootstrap.memory_lock: false
```

