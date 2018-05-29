# Linux
## Linux链接
### 软链接（符号链接）
* 通过一个文本文件指明另一个文件的位置信息
### 硬链接
* Linux中，保存在磁盘分区中的所有文件都会分配一个编号，称为索引节点号（Inode Index）
* 通过索引节点来进行连接，即通过多个文件名指向同一个索引节点，让一个文件拥有多个路径
* ，只有最后一个硬链接被删除后，文件的数据块及目录的连接才会被释放。通过建立硬链接到重要文件，可防止误删
### 语法
* 语法: $ ln [-options] <file1> <file2>
* 参数
    * 无参数
        * 硬链接
    * -s
        * 符号链接
## Linux Shell (bash)
### whereis
### Linux用户与用户组
* Linux用户管理
    * useradd
        * 添加新的用户账号
        * 语法
            * useradd [options] <username>
        * 选项
            * -c <comment>
                * 指定一段注释性描述
            * -d <dir>
                * 指定用户主目录，如果此目录不存在，则同时使用-m选项，可以创建主目录。
            * -g <用户组{,<用户组>}>
                * 指定用户所属的用户组
            * -G <用户组{,<用户组>}>
                * 制定用户所属的附加组
            * -s <Shell文件>
                * 指定用户的登录shell
            * -u [-o] <用户号>
                * 制定用户的用户号，如果同时由-o选项，则可以重复选择其他用户的标识号
    * userdel
        * 删除账号
            * 删除用户在系统文件中（主要是/etc/passwd, /etc/shadow, /etc/group等）的记录
        * 语法
            * userdel [选项] <username>
        * 选项
            * -r
                * 把用户的主目录一起删除
    * usermod
        * 修改账号
        * 语法
            * usermod [options] <username>
        * 选项
            * -c <comment>
                * 指定一段注释性描述
            * -d <dir>
                * 指定用户主目录，如果此目录不存在，则同时使用-m选项，可以创建主目录。
            * -g <用户组{,<用户组>}>
                * 指定用户所属的用户组
            * -G <用户组{,<用户组>}>
                * 制定用户所属的附加组
            * -s <Shell文件>
                * 指定用户的登录shell
            * -u [-o] <用户号>
                * 制定用户的用户号，如果同时由-o选项，则可以重复选择其他用户的标识号
            * -l <NewName>
                * 在某些系统有效，指定新的用户名
    * passwd
        * 用户口令的管理
        * 语法
            * passwd [options] [Username]
        * 选项
            * -l
                * （lock）锁定口令，即禁用账号
            * -u
                * （unlock）口令解锁
            * -d
                * 使账号无口令
            * -f
                * 强迫用户下次登录时修改口令
        * 如果默认用户名（不输入），则修改当前用户的口令
* Linux用户组管理
    * groupadd
        * 增加一个新的用户组
        * 语法
            * useradd [options] <userGroup>
        * 选项
            * -g <GID>
                * 指定新用户的组标识号（GID）
            * -o
                * 一般与-g同时使用，表示新用户组的GID可以与系统以有用户用户组相同（overwrite）
    * groupdel
        * 删除已有的用户组
        * 语法
            * groupdel <userGroup>
    * groupmod
        * 修改用户组的属性
        * 语法
            * groupmod [options] <usergroup>
        * 选项
            * -g <GID>
                * 为用户组指定新的组标识号
            * -o
                * 与-g同时使用，表示新的GID可以与已有的GID相同
### mkswap
### swapon
### make
* 编译
    * 子主题 1
        * 当 make 命令第一次执行时，它扫描 Makefile 找到目标以及其依赖。如果这些依赖自身也是目标，继续为这些依赖扫描 Makefile 建立其依赖关系，然后编译它们。一旦主依赖编译之后，然后就编译主目标（这是通过 make 命令传入的）。
* 目标
    * $ make clean
        * 清理所有的目标文件和可执行文件
    * $ make all
        * 编译所有目标
    * $ make install
        * 安装已编译的程序
    * $ make uninstall
        * 卸载已安装的程序
    * $ make distclean
        * 删除由./configure产生的文件
    *  $ make check
        * 测试刚编译的软件
    * $make installcheck
        * 检查安装的库和程序
    * $ make dist
        * 重新打包成packname-version.tar.gz
* 参数
    * $ make -B
        * 让所有目标总是重新建立，会强制编译所有的目标文件以及最终的执行文件
    * $ make -f [fileName]
        * make会选择扫描my_makefile来代替Makefile
### more
* 对长输出一页页显示
### find
* 语法
    * $ find <path> -option   [   -print ]   [ -exec   -ok   command ]   {} \;
* 参数
    * -name
*XMind: ZEN - Trial Version*