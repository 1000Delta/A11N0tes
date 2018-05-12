# snoopy 库

## Snoopy类

```php
$snp = new Snoopy();
```

### `fecth` 方法

通过GET方式向网页请求数据

```php
$snp->fecth($url);
```

参数：

- `$url` 目标网页的url（和GET数据）

### `submit` 方法

通过POST方法向网页请求数据

```php
$snp->submit($url, $data);
```

### `results` 属性

获取到的网页数据

```php
$snp->results
```