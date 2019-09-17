# Linux用户与用户组

## 用户管理

### useradd

```shell
useradd [options] <username>
```

添加新的用户

常用选项：

- `-c <comment>`
  - 指定一段注释性描述
- `-d <dir>`
  - 指定用户主目录，如果此目录不存在，则同时使用`-m`选项，可以创建主目录。
- `-g <用户组{,<用户组>}>`
  - 指定用户所属的用户组
- `-G <用户组{,<用户组>}>`
  - 制定用户所属的附加组 **sudo组**
- `-s <Shell文件>`
  - 指定用户的登录shell
- `-u [-o] <用户号>`
  - 制定用户的用户号，如果同时由-o选项，则可以重复选择其他用户的标识号

### userdel

```shell
userdel [options] <username>
```

删除用户

选项：

- `-r`

  把用户的主目录一起删除

### usermod

```shell
usermod [options] <username>
```

修改用户

选项：

- `-c <comment>`
  - 指定一段注释性描述
- `-d <dir>`
  - 指定用户主目录，如果此目录不存在，则同时使用-m选项，可以创建主目录。
- `-g <用户组{,<用户组>}>`
  - 指定用户所属的用户组
- `-G <用户组{,<用户组>}>`
  - 制定用户所属的附加组
- `-s <Shell文件>`
  - 指定用户的登录shell
- `-u [-o] <用户号>`
  - 制定用户的用户号，如果同时由-o选项，则可以重复选择其他用户的标识号
- `-l <NewName>`
  - 在某些系统有效，指定新的用户名

### passwd

```shell
passwd [options] [username]
```

管理用户口令

命令后不加用户名时默认为当前用户

选项：

- `-l`
  - （lock）锁定口令，即禁用账号
- `-u`
  - （unlock）口令解锁
- `-d`
  - 使账号无口令
- `-e`
  - 强迫用户下次登录时修改口令

## 用户组管理

### groupadd

```shell
useradd [options] <group>
```

增加一个新的用户组

选项：

- `-g <GID>`
  - 指定新用户的组标识号（GID）
- `-o`
  - 一般与-g同时使用，表示新用户组的GID可以与系统以有用户用户组相同（overwrite）

### groupdel

```shell
groupdel <group>
```

删除已有的用户组

### groupmod

```shell
usermod [options] <group>
```

修改用户组的属性

选项：

- `-g <GID>`
  - 为用户组指定新的组标识号
- `-o`
  - 与-g同时使用，表示新的GID可以与已有的GID相同

## 实战

创建一个名为tempuser的用户，密码为123456，并添加到root用户组

用户文件夹存放在`/home/tempuser/`，生成时自动创建

```shell
useradd -dm /home/tempuser/ -g root tempuser
passwd tempuser
123456
```

