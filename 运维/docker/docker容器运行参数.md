# docker容器运行参数

> 摘自各种实例，观察参数总结用法



`--rm` 停止运行后，自动删除容器文件

`--name [container_name]` 容器名

`--volume "$PWD":/var/www/html`  将当前目录（`$PWD`）映射到容器的`/var/www/html`（Apache 对外访问的默认目录）。因此，当前目录的任何修改，都会反映到容器里面，进而被外部访问到。