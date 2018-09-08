# SQL 分类

## 按照**数据类型**分类

---

### 整形注入

不需要单引号闭合

### 字符型输入

需要单引号闭合并且注释掉之后的单引号


## 按照**注入语法**分类

---

### UNION query SQL inject (可怜和查询注入)

可以使用 `UNION` 语句的注入

### Error-based SQL injection (报错型注入)

页面会返回错误信息或者直接返回注入的结果

### Boolean-based blind SQL injection (布尔型注入)

根据返回页面来判断条件真假的注入

### Time-based blind SQL injection (基于时间延迟注入)

不能根据页面返回内容判断真假信息，要用条件语句判断**时间延迟**是否被执行来判断注入是否成功

### Stacked queryies SQL injection (可多语句查询注入)

可以多条语句同时注入

## 按照**数据提交**方式分类

---

### post

### get

### cookie

## 按照**数据库类型**分类

---

### php + mysql

### asp + access

### asp + oracle