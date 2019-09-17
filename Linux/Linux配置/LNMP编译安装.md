# LNMP编译安装

## PHP编译安装

> 参考自 https://blog.csdn.net/just_shunjian/article/details/78686776

### 版本

> 7.2.0

### 流程

1. 下载php源码并解压

   ```bash
   wget http://cn2.php.net/distributions/php-7.2.0.tar.gz
   tar -zxvf php-7.2.0.tar.gz
   ```

2. 编译安装

   ```bash
   mkdir /usr/local/php # 准备安装文件夹
   cd php-7.2.0/
   # 在编译参数中, 针对不同的环境有一定选择, 此处针对LNMP
   ./configure \
   --prefix=/usr/local/php \ # 指定程序存放路径
   --enable-sockets=shared \ # 
   --with-pdo-mysql=shared,mysqlnd \ # 指定使用 pdo 扩展
   --enable-fpm # 启动配置php-fpm
   make install
   ```

3. 复制配置文件

   ```bash
   cp php.ini-development  /usr/local/php/lib/php.ini
   ```

4. 设置环境变量

   ```bash
   # 将php可执行文件目录加入PATH
   echo "export PATH=$PATH:/usr/local/php/bin/"  >> /etc/profile
   source /etc/profile
   ```

5. 复制启动脚本

   ```bash
   # 复制启动脚本
   $ cp ./sapi/fpm/init.d.php-fpm /etc/init.d/php-fpm
   $ chmod +x /etc/init.d/php-fpm
   # 修改php-fpm配置文件：
   $ cd /usr/local/php/etc
   $ cp php-fpm.conf.default php-fpm.conf
   $ vim php-fpm.conf # 去掉 pid = run/php-fpm.pid 前面的分号
   $ cd php-fpm.d
   $ cp www.conf.default www.conf
   $ vim www.conf # 修改user和group的用户为当前用户(也可以不改，默认会添加nobody这个用户和用户组)
   
   
   ```

6. 安装扩展

   1. mbstring
   2. pdo_mysql
   3. ...

   安装过程请参考https://blog.csdn.net/just_shunjian/article/details/78686776

## Nginx 编译安装

```bash
./configure
```

在配置时可能会出现相关报错（PCRE, openSSL）,需要安装以下程序(ubuntu)：

```bash
sudo apt-get install libpcre3 libpcre3-dev
sudo apt-get install openssl libssl-dev
sudo apt-get install zlib1g-dev 

```

