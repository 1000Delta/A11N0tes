# MySQL模式匹配

## LIKE匹配

用于在WHERE子句中搜索列中的指定模式

语法：

```mysql
SELECT column_name(s)
FROM table_name
WHERE column_name LIKE pattern;
```

模式（pattern）说明：

- `%` 用于匹配一个或多个缺省字符

  例：`%oo%`可以匹配`google`、`facebook`等

- `-` 用于匹配一个缺省字符



可用于模糊搜索