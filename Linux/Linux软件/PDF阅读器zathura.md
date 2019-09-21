# PDF阅读器 Zathura 安装

## 安装

```shell
# arch 系
sudo pacman -S zathura
```

## 错误解决

###　无法识别 appliaction/pdf

安装`zathura-pdf-propper`

```shell
sudo pacman -S zathura-pdf-propper
```

安装过程可能提示 破坏依赖关系 `propper` 版本较低

此时更新propper即可

```shell
sudo pacman -S propper
```

## 配置文件

`Zathura` 的配置文件名为`zathurarc` ，分为全局配置和用户配置，全局配置文件路径为 `/etc/`