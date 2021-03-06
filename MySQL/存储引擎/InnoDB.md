# InnoDB

## 特性

- 行锁
- 支持外键（Foreign key）
- 非锁定读，默认读取操作不会产生锁
- 可以将多个表存储为同一个文件（.ibd）
- 支持使用裸设备（raw disk）建立表空间
- 表的大小只受操作系统的限制

## InnoDB 锁的类型

InnoDB有3种锁：

1. Record Lock 行锁，锁定当前读取的行
2. Gap Lock 间隙锁，锁定被读取的范围，不包括当前读取的行
3. Next-Key Lock 行锁+间隙锁

### 行级锁定（Record Lock）

InnoDB以这样一种方式执行行级锁定：当它搜索或扫描表的索引之时，它对**遇到的索引记录**设置共享或独占锁定。因此，行级锁定事实上是索引记录锁定。 

### 间隙锁定（Next-key Lock）

> 实际是行锁+间隙锁

InnoDB使用间隙锁定来避免幻读（phantom read）

当MySQL的隔离级别（isolation level）设置为Repeatable Read时会触发间隙锁定

#### 间隙锁定的工作方式

1. 读取一个不存在的行，则锁定所有的insert行为
2. 读取某个约束内的行，则锁定所有约束范围内的insert行为

#### 间隙锁定的应用

比如有多次相同范围的SELECT，在读取中穿插了INSERT操作，如果没有设置Next-key Lock，并且插入范围在读取范围内，那么插入前后的读取操作就会获取到不同的数据，即出现幻读。如果设置了间隙锁定，那么在读取这个范围的同事