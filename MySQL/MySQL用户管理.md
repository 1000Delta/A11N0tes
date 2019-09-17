# MySQL用户管理

## 创建用户

```mysql
CREATE USER 'username'@'host' IDENTIFIED BY 'password';
```

- `username` 你将创建的用户名
- `host` 指定登录主机，`'localhost'`指只能在本地登录，若为`%`表示在任何电脑上都能登录；也可以制定某台机器可以远程登录
- `password` 该用户的登录密码，密码可以为空



## 授权

```mysql
GRANT privileges ON databasename.tablename TO 'username'@'host'
```

- `privileges` 用户的操作权限，如SELECT，INSERT，UPDATE等。如果要授予所有权限则使用`ALL privileges`
- `databasename.tablename` 数据库名.表名，如果要授予该用户所有权限则可用`*.*`



## 创建用户同时授权

例：

```mysql
GRANT ALL privileges ON mq.* to test@loclahost identified by '1234';

FLUSH privileges;
```

必须执行第二句`FLUSH privileges`， 否则登录会提示 ERROR 1045(没看到?)



##　设置与更改用户密码

```mysql
SET PASSWORD FOR 'username'@'host' = PASSWORD('newpassword');
```

```mysql
ALTER USER 'username'@'host' IDENTIFIED BY 'newpassword'
```



## 撤销用户权限

```mysql
REVOKE privilege ON databasename.tablename FROM 'uesername'@'host';
```



## 删除用户

```mysql
DROP USER 'username'@'host'
```



## 查看用户授权

```mysql
SHOW GRANTS FOR 'user'@'host';
```



## 允许用户从所有主机访问

```mysql
USE mysql;
UPDATE user SET host='%' WHERE user='user';
```

