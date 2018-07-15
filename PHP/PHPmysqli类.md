# PHP mysqli类

## 预编译处理流程（有点坑）

1. `mysqli::prepare()`设计预编译语句

   这一步和PDO一样

2. `mysqli_statement::bind_param()`绑定参数

   `bind_param()`第一个参数为参数类型构成的字符串

   参数类型：

   - `i` integer
   - `d` double
   - `s` string
   - `b` bolb

   例：四个参数分别为整型、浮点型、整型、整型，则

   ```php
   $stmt->bind_param('idii', $var1, $var2, $var3, $var4);
   ```

3. `mysqli_statement::execute()`执行查询

   字面意思

4. `mysqli_statement::bind_result()`绑定结果

   这是mysqli类预编译中与其他方法不同的一点，它需要预先将结果绑定在一个变量上