# Linux制作启动盘

首先卸载已经需要制作启动盘的文件系统：

```shell
sudo umount /dev/sdb # 此处sdb为我的U盘
```

识别设备可以通过`lsblk`命令

然后格式化：

```shell
sudo mkfs.vfat /dev/sdb -I
```

使用`dd`命令写入ISO文件：

```shell
sudo dd if=xxx.iso of=/dev/sdb
```

## 分区

如果是对设备分区进行写入的话，还需要将其标记可启动盘：

```shell
sudo fdisk /dev/sdb
```

`fdisk`命令列表：

```shell
帮助：

  DOS (MBR)
   a   开关 可启动 标志
   b   编辑嵌套的 BSD 磁盘标签
   c   开关 dos 兼容性标志

  常规
   d   删除分区
   F   列出未分区的空闲区
   l   列出已知分区类型
   n   添加新分区
   p   打印分区表
   t   更改分区类型
   v   检查分区表
   i   打印某个分区的相关信息

  杂项
   m   打印此菜单
   u   更改 显示/记录 单位
   x   更多功能(仅限专业人员)

  脚本
   I   从 sfdisk 脚本文件加载磁盘布局
   O   将磁盘布局转储为 sfdisk 脚本文件

  保存并退出
   w   将分区表写入磁盘并退出
   q   退出而不保存更改

  新建空磁盘标签
   g   新建一份 GPT 分区表
   G   新建一份空 GPT (IRIX) 分区表
   o   新建一份的空 DOS 分区表
   s   新建一份空 Sun 分区表
```

使用`a`命令指定启动分区：

```shell
命令(输入 m 获取帮助)： a
分区号 (1,2, 默认  2): 1

分区 1 的 可启动 标志已禁用。

命令(输入 m 获取帮助)： a
分区号 (1,2, 默认  2): 2

分区 2 的 可启动 标志已启用。
```

