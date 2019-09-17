# PHP & MySQL
## SQL（for MySQL）
### 基本操作
* `SELECT FROM`
    * 从数据库中选取数据
    * AS
        * 为表名称或列名称指定别名
* `UPDATE SET`
    * 更新表中的记录
    * 如果不使用 WHERE 语句指定记录，则所有记录都会被更新
* `INSERT INTO`
    * 向表中插入新纪录
    * 当不指定列名时需要按照字段名在表中的顺序列出所有数据
* `DELETE FROM`
    * 删除表中的记录
    * 如果忽略 WHERE 语句，则所有记录都会被删除
* 子主题 5
### 子句
* `WHERE`
    * 提取满足指定标准的记录
    * 支持的运算符
        * `=`
        * `<>`或`!=`
        * `>`
        * `<`
        * `>=`
        * `<=`
        * `BETWEEN`
        * `LIKE`
        * `IN`
* `ORDER BY`
    * 对结果集进行排序，默认按照升序排序（ASC），如果要按照降序，请使用DSEC关键字
    * 多列排序：当按照多个列进行排序时，会先按照第一个列排序，再将第一个列相同的元素按照第二个列排序，以此类推
* `LIMIT`
    * 规定要返回的记录的数目
* `LIKE`
    * 在 WHERE 子句中搜索列中的指定模式（类似于RE）
* `REGEXP`或`RLIKE`
    * 操作正则表达式
* `JOIN`
    * 把来自多个表的行结合起来
    *  table_name INNER JOIN table_name IN column_name1=column_name2
* `GROUP BY`
    * 用于结合Aggregate函数，根据一个或多个列对结果集进行分组
* `HAVING`
    * 用于对结果集进行筛选（应用Aggregate函数约束）
### 操作符
* `AND`
* `OR`
* `IN`
    * 在 `WHERE` 字段中匹配多个值
* `BETWEEN`
    * 选取介于两个值之间的数据（数值、文本或日期）
### 通配符
* `%`
    * 替代0个或多个字符
* `_`
    * 替代一个字符
* `[charlist]`
    * 字符列中的任何单一字符
* `[^charlist]`
    * 不在字符列中的任何单一字符
### 约定
* 文本字段 vs. 数值字段
    * SQL 使用单引号（或双引号）来环绕文本值，数值字段不使用引号
### 函数
* Aggregate（聚合） 函数
    * `AVG( )`
        * 返回平均值
        * 语法： SELETE AVG(column_name) FROM table_name
    * `COUNT( )`
        * 返回匹配指定条件的行数
        * 语法：同上
    * `MAX( )`
        * 返回指定列的最大值
        * 语法：同上
    * `MIN( )`
        * 返回指定列的最小值
        * 语法：同上
    * `SUM( )`
        * 返回数值列的总数
* Scalar 函数
## Mysqli Class
### 创建连接对象
* `$db = new mysqli($host, $username, $passwd, $dbname, $socket);`
* 可变参数列表，从右往左依赖
### 设置连接参数
* 选择用于查询的默认数据库
    * `$db->select_db($dbname)`
* 更改指定的用户
    * `$db->change_user($user, $passwd, $database)`
### 执行一次查询
* $result = $db->query($query);
### 预编译 & 执行
* 将SQL语句中的参数用 ? 进行代替
* `$stmt = $db->prepare($param_query)`
* `$stmt->bind_param($type, $varlist)`
    * $type 每个参数的类型
        * 类型
            * `i`
                * integer
            * `d`
                * double
            * `s`
                * string
            * `b`
                * blob
                    * 二进制大对象，将会被发送到packet中
        * 格式
            * 为多个参数类型字符组成的字符串
    * `$varlist`参数列表
* `$stmt->execute()`
* `$stmt->fetch()`
    * 拉取查询结果（每次只拉取一行）
    * 可使用循环语句进行遍历
### 执行批量查询 & 结果集处理
* 批量查询
    * `$db->multi_query($query)`
* 检查是否有结果集
    * `$db->more_results()`
* 初始化一个结果集检索
    * `$db->use_result()`
* 处理下一个结果
    * `$db->next_result()`
* 从上一次查询返回一个结果集
    * `$result=$db->store_results()`
    * `$result->free()`
        * 在结果集很大时非常重要
### 查看操作影响条目数
* `$db->$affected_rows`
    * 查看上一次查询所影响的条目数
### 关闭已打开的数据库连接
* `$db->close()`
## PDO
### 创建一个连接
* `$dbh = new PDO($dsn, $username, $passwd, [$param])`
* `$dsn` - 数据源，包含了请求连接到数据库的信息
    * 直接连接数据库
    * 通过url形式
    * 通过php.ini配置文件
* `$param` - 指定的连接参数
### 预处理
* `$stmt = $dbh->prepare($sql)`
* `$sql` - 预处理语句
    * 用 '?' 来代替直接插入到语句中的变量值
    * 用  ':attr_name' 来显著的表明要插入的变量
* `$stmt->bindParam($parameter, $param)`
* `$stmt->execute()`
* 在驱动程序不支持时，PDO将进行模拟，确保应用程序可以使用相同的数据访问模式
### 错误处理
* `$dbh->errorInfo()`
* `$dbh->errorCode()`
## SQL 防注入
### 检查用户提交的值的数据类型
* 返回错误
* 进行数据类型转换
### 所有带有参数的查询都使用预编译插入变量
## 事务处理
*XMind: ZEN - Trial Version*