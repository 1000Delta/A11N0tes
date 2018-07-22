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

   `mysqli_statement::fetch()`查询一行记录

   这是mysqli类预编译中与其他方法不同的一点，它需要预先将一行中的每一个结果分别绑定在一个变量上，但是，在执行`fetch()`前，绑定的变量并不会存储值，只有在执行了`fetch()`后，才会将当前查询的结果集的第一行存入结果变量中，然后`mysqli_statement`对象中存储结果集的指针会下移一行，便于下一次读取。

   简而言之就是“一次绑定，多次查询”