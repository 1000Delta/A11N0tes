# Laravel常用类与方法

## 路由

```php
Route::get(); //生成路由,包含 post put patch delete options
Route::get()->name(); 正则约束
Route::get()->where(); 命名路由
Request::route()->named(); //检查是否路由到指定命名路由
```

## 重定向

```php
redirect()->route(); //重定向到指定名称路由
```

