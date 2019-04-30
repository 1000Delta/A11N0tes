# Go依赖包安装

使用VSCode安装Go的依赖包会出现部分安装失败的问题，可以使用Go官方在github的同步源进行替换

## 替换墙外内容

需要在GOPATH下创建文件夹并下载依赖:

```sh
mkdir -p $GOROOT/src/golang.org/x
git clone https://github.com/golang/tools
# gopls所需依赖
git clone https://github.com/golang/net
git clone https://github.com/golang/sync
# net所需依赖
git clone https://github.com/golang/text
git clone https://github.com/golang/crypto
# golint
git clone https://github.com/golang/lint
```

## 使用代理

设置本机代理`~/proxy.conf`

```
export http_proxy=
export https_proxy=
```

设置为你的代理地址

然后`source ~/proxy.conf`

使用代理后各工具均可直接安装

## 安装

### 使用vscode

在linux上vscode以非root身份启动时，如果你的go开发工具源码存放在非用户目录将会没有权限读取导致安装工具失败，此时需要修改所有者或者修改权限：

```sh
cd $GOROOT/src/golang.org/x
sudo chmod -R 777 *
```

然后在vscode中激活扩展，按`shift`+`ctrl`+`p`，输入`Go: Install/Update tools`，勾选全部工具，安装即可。