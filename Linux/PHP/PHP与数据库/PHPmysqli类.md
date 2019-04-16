# PHP mysqli类

## 基础

### 创建连接对象

- `$db = new mysqli($host, $username, $passwd, $dbname, $socket);`
- 可变参数列表，从右往左依赖

### 设置连接参数

- 选择用于查询的默认数据库
  - `$db->select_db($dbname)`
- 更改指定的用户
  - `$db->change_user($user, $passwd, $database)`

### 执行一次查询

- $result = $db->query($query);

### 预编译 & 执行

- 将SQL语句中的参数用 ? 进行代替
- `$stmt = $db->prepare($param_query)`
- `$stmt->bind_param($type, $varlist)`
  - $type 每个参数的类型
    - 类型
      - `i`
        - integer
      - `d`
        - double
      - `s`
        - string
      - `b`
        - blob
          - 二进制大对象，将会被发送到packet中
    - 格式
      - 为多个参数类型字符组成的字符串
  - `$varlist`参数列表
- `$stmt->execute()`
- `$stmt->fetch()`
  - 拉取查询结果（每次只拉取一行）
  - 可使用循环语句进行遍历

### 执行批量查询 & 结果集处理

- 批量查询
  - `$db->multi_query($query)`
- 检查是否有结果集
  - `$db->more_results()`
- 初始化一个结果集检索
  - `$db->use_result()`
- 处理下一个结果
  - `$db->next_result()`
- 从上一次查询返回一个结果集
  - `$result=$db->store_results()`
  - `$result->free()`
    - 在结果集很大时非常重要

### 查看操作影响条目数

- `$db->$affected_rows`
  - 查看上一次查询所影响的条目数

### 关闭已打开的数据库连接

- `$db->close()`



1. 