# Linux 安装字体

1. 将字体的ttf文件放到`/usr/share/fonts/`下的**某个文件夹**

2. 修改字体文件权限为 644

3. 在目录下打开终端，执行命令：

    ubuntu:

   ```bash
   sudo mkfontscale
   sudo mkfontdir
   sudo fc-scale -fv
   ```

    Arch:

    ```bash
    sudo fc-cache -vf
    ```


之后就可以使用了

