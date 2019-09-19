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





