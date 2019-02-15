# 替换shell为zsh

## zsh

### 安装

Ubuntu:

```shell
sudo apt-get install zsh
```

## oh-my-zsh

### 安装oh-my-zsh

1. 自动安装

   ```shell
   wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh
   ```

2. Github

   ```shell
   git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
   cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
   source ~/.zshrc
   ```