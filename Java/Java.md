# Java
## Java I/O
### Java Scanner类
* 导入包
    * java.util.Scanner
* 实例化Scanner对象
    * Scanner scanner = new Scanner(System.in)
* 方法
    * .hasNext()
        * 判断是否有下一个
    * next()
        * 读取到有效字符后结束输入
        * 自动去除有效字符前的空格
        * 输入到有效字符后会将后面的空格作为分隔符
    * .nextLine()
        * 以Enter作为结束符，返回回车之间的所有字符
        * 可以读取空格
    * .nextInt()
    * .nextFloat()
### System.out
* 标准输出设备
* 方法
    * print()
        * 输出一个表达式的结果
    * println()
        * 输出一个表达式结果并换行
### System.in
* 标准输入设备
## Java 数据类型
### byte
* 8bit
### short
* 16bit
### int
* 32bit
### long
* 64bit
### float
* 32bit
### double
* 64bit
### char
* 16bit
### boolean
* 8/32bit
## Java 文件操作
### File类（抽象路径名）
* 构造方法
    * File(String path)
    * File(String url)
    * File(String disk)
* 常用方法
    * boolean isDIrectory()
        * 判断抽象路径名指向的是否为目录
    * String[] list()
        * 返回抽象路径名表示的目录下的文件名组成的字符串数组
    * File[] listFiles()
        * 返回抽象路径名表示的目录下的文件抽象路径名对象（File对象）构成的数组
    * mkdir()
        * 创建此抽象路径名指定的目录
    * mkdirs()
        * 创建此抽象路径名指定的目录，包括创建必需但不存在的父目录
    * renameTo(File dest)
        * 重新命名此抽象路径名表示的文件
    * getParent()
        * 返回此抽象路径名表示的文件或目录的父目录的名称，若没有则返回NULL
    * getParentFile()
        * 同上的FIle形式
### FileReader类
* 构造方法
    * FileReader(File file)
        * 创建一个执行抽象路径名的读取器
* 常用方法
    * read()
        * 读取一个字符并移动指针到下一个
    * read(char[] cbuf, int offset,  int length)
        * 将字符读入到数组的某一部分
        * 参数
            * cbuf
                * 目标缓冲区
            * offset
                * 起始偏移量
            * length
                * 要读取的最大字符数
        * 返回值
            * 读取的字符数，到达文件尾则返回-1
    * close()
### FileWriter类
* 构造方法
    * FileWriter(File file)
        * 创建一个执行抽象路径名的写入器
* 常用方法
    * write(int ch)
        * 写入一个字符
    * write(char[] cbuf, int offset,  int length)
        * 将字符数组写入到文件
        * 参数
            * cbuf
                * 目标缓冲区
            * offset
                * 起始偏移量
            * length
                * 要读取的最大字符数
    * write(String str, int offset,  int length)
        * 将字符串写入到文件
        * 参数
            * cbuf
                * 指定字符串
            * offset
                * 起始偏移量
            * length
                * 要读取的最大字符数
    * flush()
        * 刷新缓冲区
    * close()
## Java API
### 获取系统时间日期
* java.util.Date
* java.text.SimpleDateFormat
### 延时
* Thread.currentThread().sleep(long time)
    * 将当前线程挂起time指定的毫秒
* Timer类
## Java 数组
### class array
* dataType[] arrayName
    * 创建数组
        * dataType[] arrayName = new dataType[length]
    * 预定义数组
        * dataType arrayName = {element1, element2, ...}
### 遍历
* for
* foreach
    * for (float x: f) {}
        * 定义一个float类型的变量f，将f数组内的元素依次赋值给变量x
### Arrays工具类
* sort()
    * 对数组元素升序排序
* binarySearch()
    * 对数组元素二分查找
* equals()
    * 判断数组是否相等
### System.arraycopy(Object src, int srcPos, Object dest, int destPos, int length)
* 复制源数组到目标数组中，从src的srcPos索引开始，复制到dest的destPos开始，总数是length个
* 参数
    * src : Object
        * 源数组
    * srcPos : int
        * 源数组起始索引
    * dest : Object
        * 目标数组
    * destPos : int
        * 目标数组起始索引
    * length : int
        * 复制元素个数
## Java OOP
### 调用方式
* 调用方法使用object.method()
* 调用属性使用object->attribute
### 接口
* 同PHP
### 继承
### 关键字
* abstract
    * 指定抽象类
* interface
    * 指定为接口
* implements
* extends
* final
    * 指定类为最终的类，即不可被继承
* this
    * 指向当前的对象
* super
    * 指向对象包含的父对象
    * 无法使用父对象中private修饰的属性/方法
* static
    * static方法（类方法）
        * static方法内部不能调用非静态方法，反之可以
    * 静态变量（类变量）
        * 可以通过类名访问
## Java String 类
### 方法
* length()
    * 返回字符串长度
* compareTo(string str)
    * 返回两个字符串对象的比较结果，若相等，返回0。不相等时，从两个字符串第0个字符开始比较，返回第一个不相等的字符差；另一种情况，较长字符串的前面部分恰巧是较短的字符串，返回它们的长度差。
* substring(int start[, int end])
    * 返回指定子串
    * 参数
        * start
            * 开始的字符索引
        * end
            * 结束的字符索引
* indexOf(String pattern)
    * 返回字符串模式在字符串中第一次出现的位置
## Java StringBuffer 类
### 方法
* StringBuffer(String str)
    * 构造方法，生成一个StringBuffer对象，str参数为字符串内容
* append(String str)
    * 在末尾添加str指定的字符串
* reverse()
    * 将StringBuffer对象中的内容反转，生成新的字符串
* insert(int index, String str)
    * 在index指定的索引处插入str串
* delete(int start, int end)
    * 删除start到end-1的子串
## Java 异常类（Exception）
### 关键字
* throws
    * 跟在方法名后表示可能抛出异常的类型
    * throws <异常类型>[, <异常类型>]
* throw
    * 用在方法体中，抛出一个异常对象
    * throw new ExceptionName();
    * 抛出异常后剩余的语句都不会执行
* try
* catch
概要外部用try {} catch {} 语句捕获异常，try() 中执行的方法需要用throws指定可能会抛出的异常，内部使用throw来抛出异常
* throws
* throw
* try
* catch
## Java 网络编程
### Socket编程
* ServerSocket类
    * 常用方法
        * 构造方法
            * ServerSocket(int port)
                * 实例化一个服务器套接字绑定到本地服务器指定端口
        * accept()
            * 接收一个套接字连接请求，如果当前没有请求则会一直等待
        * close()
            * 关闭指定套接字
* Socket类
    * 常用方法
        * 构造方法
            * Socket(String host, int port)
                * 实例化一个流套接字并连接到指定主机的指定端口号
            * Socket()
                * 实例化一个未连接流套接字对象
            * Socket(InetAddress host, int port)
                * 实例化流套接字并连接到指定的ip和端口
        * bind(SocketAddress bindpoint)
            * 将套接字绑定到本地地址
        * close()
            * 关闭此套接字
        * connect(SocketAddress endpoint)
            * 将此套接字连接到服务器
        * getInetAddress()
            * 返回此套接字的地址
        * getPort()
            * 返回此套接字连接到的指定端口
        * getOutputStream()
            * 返回此套接字的输出流
        * getInputStream()
            * 返回此套接字的输入流
        * shutdownOutput()
            * 关闭此套接字的输出流
* DatagramSocket类
* SocketAddress
* InetSocketAddres
*XMind: ZEN - Trial Version*