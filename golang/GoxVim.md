# Go X Vim

配置Go和Vim开发环境

安装好[Vim和相应插件(Vundle等)](../vim/一次性配置Vim流程.md)

安装Vim插件vim-go

修改`~/.vimrc`， 在`Vundle#begin`和`Vundle#end`之间加上一行：

```shelll
Plugin 'faith/vim-go'
```

在vim中执行`:PluginInstall`

配置Go自动补全的设置：

```shell
cd $GOPATH/src/github.com/nsf/gocode/vim
./update.bash
gocode set propose-builtins true # 开启自动提示GO内置函数
```

使用`gocode set`可以列出所有选项，自行添加所需选项





