# Linux 双系统时间设置

## Ubuntu

```shell
sudo vim /etc/default/rcS
```

将其中一行：

```shell
UTC=yes
```

改为`no`即可。

## Manjaro

进入 系统设置 - 时间与日期 - 勾选 【本地时区的硬件时钟】 即可。