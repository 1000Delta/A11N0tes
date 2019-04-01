# Linux 启动器

通过创建启动器的方式可以快速打开软件

启动器为`.desktop`格式的文件  

示例：

```
[Desktop Entry]
Encoding=UTF-8
Name=IntelliJ IDEA
GenericName=IntelliJ IDEA
Comment=The Java IDE for Professional Developers by JetBrains
Exec=/opt/SoftWare/idea-IU-172.4343.14/bin/idea.sh %f
Icon=/opt/SoftWare/idea-IU-172.4343.14/bin/idea.png
Terminal=false
Type=Application
Categories=Application;Programme;
```

## 语法

| 关键词          | 意义                   |
| --------------- | ---------------------- |
| [Desktop Entry] | 文件头                 |
| Encoding        | 编码                   |
| Name            | 应用名称               |
| Name[xx]        | 在xx语言下的应用名称   |
| GenericName     | 描述                   |
| Comment         | 注释                   |
| Exec            | 执行的命令             |
| Icon            | 应用图标               |
| Terminal        | 是否使用终端           |
| Type            | 应用器类型             |
| Categories      | 应用的类型（内容相关） |

## 参数

- 其中 Exec 常用的参数有：`%f` `%F` `%u` `%U`  
- *`%f`：单个文件名，即使选择了多个文件。如果已选择的文件不在本地文件系统中（比如说在HTTP或者FTP上），这个文件将被作为一个临时文件复制到本地，％f将指向本地临时文件；*  
- *`%F`：文件列表。用于程序可以同时打开多个本地文件。每个文件以分割段的方式传递给执行程序。*  
- *`%u`：单个URL。本地文件以文件URL或文件路径的方式传递。*  
- *`%U`：URL列表。每个URL以分割段的方式传递给执行程序。本地文件以文件URL或文件路径的方式传递。*