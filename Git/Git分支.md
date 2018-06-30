# Git分支

>  Git 的分支，其实本质上仅仅是**指向提交对象的可变指针**。 Git 的默认分支名字是 `master`。 在多次提交操作之后，你其实已经有一个指向最后那个提交对象的 `master` 分支。 它会在每次的提交操作中自动向前移动。
>
> `master`分支并不特殊，它只是`git init`命令默认创建的。

git 有一个特殊指针`HEAD`，它会指向**当前所在**的本地分支。

`HEAD`指针指向的是一个分支而不是当前库中的文件快照，指向快照的是分支

```flow
head=>operation: HEAD指针
branch1=>operation: 分支指针1
branch2=>operation: 分支指针2
snapshot=>operation: 文件快照
head->branch1->snapshot
branch2->snapshot
```



主命令：

```bash
git branch
```

次级命令：

- `[branch_name]` 新建分支
- `-a` 显示所有分支（本地和远程）
- `-d` 删除分支（已合并）
- `-D` 强制删除分支



## 创建分支

```bash
git branch newone
```

将会**在当前的对象上**创建一个名为`newone`的 指针



## 分支切换

```bash
git checkout newone
```



## 查看各个分支

```bash
git log --decorate
```

