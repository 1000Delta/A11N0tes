# MySQL存储引擎

> MySQL的存储引擎是插件式的，采用通用的接口来实现与数据库实例的对接，而底层实现均由存储引擎开发者自由处理，并且存储引擎的使用是基于表而不是数据库的，这些特性极大地提高了数据存储的灵活性。

## InnoDB

- 行锁
- 支持外键（Foreign key）
- 非锁定读，默认读取操作不会产生锁
- 可以将多个表存储为同一个文件（.ibd）
- 支持使用裸设备（raw disk）建立表空间
- 表的大小只受操作系统的限制
- 使用Next-key Lock防止幻读
- 插入缓冲（insert buffer），二次写（double write），自适应哈希索引（adaptive hash index），预读（read ahead）等高性能和高可用性的功能

### 数据存储

聚集（clusterd）方式\*

如果没有显式地在表定义是指定主键，InnoDB存储引擎会为每一行生成一个6字节的`ROWID`，并以此作为主键

## MyISAM

- 不支持事务
- 表锁
- 支持全文索引（Fulltext index）
- 缓冲池只缓存（cache）索引文件，而不缓冲数据文件
- 每个表都是一个单独的文件

## NDB

> 数据全部存放在内存中（*从 MySQL 5.1 版本开始，可以将非索引数据放在磁盘上*），由此**主键查找**（primary key lookups）的速度极快，并且通过添加NDB数据存储节点（Data Node）可以线性地提高数据库性能，是高可用、高性能的集群系统。

### 问题

> NDB存储引擎的**连接**（JOIN）操作是在MySQL数据库层完成的，而不是存储引擎层完成的。这意味着，复杂的连接操作需要巨大的网络开销，因此查询速度很慢。


  ## Memory

  - 将表中的数据存放在内存中，如果数据库重启或崩溃，表中的数据都将消失
  - Memory默认使用**哈希索引**，而不是**B+树索引**
  - 只支持表锁
  - 并发性能较差
  - 不支持TEXT和BOLB列类型
  - 存储**变长字段（varchar）**时是按照**定长字段（char）**方式进行的，因此会浪费内存（有patch解决方案（Igor Chernyshev, eBay））
  - MySQL使用Memory作为临时表来存放查询的中间结果集（intermediate result）


  ## Archive

  - 只支持INSERT和SELECT操作，从MySQL5.1开始支持索引
  - 使用zlib算法讲数据行进行压缩后存储，存储比一般可达1:10
  - 适合存储**归档**数据，如日志信息。
  - 使用行锁实现高并发插入，但是本身并不是事务安全的存储引擎，设计目标主要是提供高速的插入和压缩功能


  ## Federated

  - 并不存放数据（但是存放表的结构信息），只是指向一台远程MySQL数据库服务器上的表
  - 类似于SQL Server的**链接服务器**和Oracle的**透明网关**。但是federated只支持MySQL数据表，不支持异构数据库表


  ## Maria

  > 设计目标是取代MyISAM，开发者是MySQL的创始人之一的Michael Widenius。因此，可以看做MyISAM的后续版本

  - 支持存储数据和索引文件
  - 行锁
  - 提供了MVCC
  - 支持事务和非事务安全的选项
  - 更好的BOLB字符类型的处理性能

  

  ## 其他存储引擎

  > Merge，CSV，Sphinx，Infobright等