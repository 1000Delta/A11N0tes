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

> 参考资料
>
> <https://www.helplib.com/ubuntu/article_161727>

`Zathura` 的配置文件名为`zathurarc` ，分为全局配置和用户配置，全局配置文件路径为 `/etc/zathura/zathurarc`, 用户配置文件路径为`~/.config/zathura/zathurarc`

###　颜色配置

可以配置前景色和背景色（类solarized）：

 ```
set recolor true

set recolor-darkcolor "#FDF6E3"
set recolor-lightcolor "#073642"
 ```

