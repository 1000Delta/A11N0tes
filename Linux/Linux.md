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
* * * * * 
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