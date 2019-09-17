#   Git基本命令

`git init`初始化版本库

`git clone [option] URL [dir_name] ` 克隆远程版本库

- `[dir_name]` 设置新建目录的名字
- 参数
  - `-b <branch>` 克隆指定分支

`git add` 跟踪文件

`git rm` 删除指定文件

- `-r` 递归删除

- `-n` 删除文件预览(不会删除文件)
- `-cached` 删除文件在版本库中的缓存

`git mv` 在版本库中移动文件（重命名适用）

__.gitignore文件__ 其中存放的文件名不会被跟踪

`git status` 查看暂存区状态

`git diff` 显示文件修改前后区别（工作区-暂存区）

`git diff --cached` 显示暂存区和本地仓库之间的区别

`git commit` 

- `-m` 不加`-m`参数将会进入编辑器进行编辑
- `-a` 直接保存修改
- `--amend` 重新提交

`git log` 查看提交记录(hash值，作者，日期)

`git reset --hard` 同上

`git remote` 管理远程仓库

**参数：**

- `-v` 查看远程仓库
- `add` 添加远程仓库

`push [remote] [local_fetch]:[remote_fetch]` 从本地分支推送到远程分支

`git fetch` 拉取代码 `[remote_branch] [local_branch]`

`git branch` 查看分支

- `[branch_name]` 新建分支
- `-a` 显示所有分支（本地和远程）
- `-d` 删除分支（已合并）
- `-D` 强制删除分支

`git checkout` 

- 无参数 撤销所有修改
- `-- <file>` 撤销某个文件的修改
- `[branch_name]` 切换分支
- `-b [branch_name]`新建并切换分支
- `-b [branchname] [tagname]` 在特定标签下创建分支

`git merge [branch_name]` 合并其他分支 ，若有冲突会提示

`git rebase` 变基

`git stash` 备份当前工作区中内容，从最近的依次提交中读取相关内容，让工作区保证和上次提交的内容一致。同时将当前的工作区内容保存到Git栈中

- `git stash pop` 从 Git 栈中读取最近一次保存的内容，恢复工作区的相关内容。由于可能存在多个Stash的内容，所以用栈来管理，`pop`会从最近的一个栈中读取内容并恢复
- `git stash list` 显示 Git 栈内的所有备份，可以利用这个列表来决定从那个地方恢复。
- `git stash clear` 清空 Git 栈。此时使用 gitg 等图形化工具会发现，原来stack的那些节点都消失了。

-----

- GitLab

- rtyley
