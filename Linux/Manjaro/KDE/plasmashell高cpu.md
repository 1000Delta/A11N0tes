在相关文件里修改

```shell
vim /usr/share/plasma/plasmoids/org.kde.plasma.notifications/contents/ui/NotificationIcon.qml
```

```
 PlasmaComponents.BusyIndicator {
            anchors.fill: parent

            visible: jobs ? jobs.count > 0 : false
            running: active
        }
```

为

```
 PlasmaComponents.BusyIndicator {
            anchors.fill: parent

            visible: jobs ? jobs.count > 0 : false
            running: false
        }
```

重启

## 结果

QNMD无效

直接查日志

出现卡顿之后shell输入

```shell
journalctl -xe
```

查到是哪个文件/目录出错

然后把东西移走

立竿见影

我这里是`/opt`中的postman目录中postman可执行文件被读取而且报文件xxx行错误导致卡顿，systemd-journald和plasmashell同时高cpu占用并且使用大量缓存导致的

把postman放到了google文件夹里。。。