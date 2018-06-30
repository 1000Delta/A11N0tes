# git分支

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



