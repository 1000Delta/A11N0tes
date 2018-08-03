# Git远程管理

- `git fetch` 拉取
- `git merge` 合并到当前分支
- `git pull` 拉取并合并
- `git push` 推送
  - `git push -f` 强制推送
- `git remote` 管理远程版本库
  - `add <remote> <address>`  添加库
  - `rm <remote>` 删除远程库
  - ``

## 修改ssh默认端口号

`git remote set-url <remotename> <url>`

要求远程仓库已存在，即先通过`remote add`操作添加远程库，然后修改