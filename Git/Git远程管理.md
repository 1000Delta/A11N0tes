# Git远程管理

- `git fetch [remoteName] [branchName]` 拉取

  - `remoteName ` 远程仓库名
  - `branchName` 分支名
  - 不带参数将会拉取当前分支

- `git merge [branch]` 合并到当前分支

- `git pull` 拉取并合并

- `git push [remote] [[local_fetch]:[remote_fetch]]`  推送
  - `git push -f` 强制推送

- `git remote` 管理远程版本库
  - `add <remote> <address>`  添加库
  - `rm <remote>` 删除远程库

    

## 修改ssh默认端口号

`git remote set-url <remotename> <url>`

要求远程仓库已存在，即先通过`remote add`操作添加远程库，然后修改



## 将HTTPS账号密码保存在本地

1. 检查`git config`中`credential.helper`参数为`store`；

2. 在用户主目录（bash中为`~`，CMD中为`%HOME%`）添加文件`.git-credential`；

3. 在`.git-credential`中添加一行保存账号密码：

   > https://{username}:{password}@{host}

   `username` 用户名

   `password` 密码

   `host` Git服务器域名或地址

## 远程分支

### 推送

### 拉取

`git fetch <remote> <branch>`

### 删除远程分支

`git remote --delete <remote> <branch>`

### 跟踪远程分支

`git branch -b <branch> <remote>/<branch>`

设置分支跟踪上游分支

`git branch -u <remote>/<branch>`

更新当前分支的上游分支

### 上游快捷方式