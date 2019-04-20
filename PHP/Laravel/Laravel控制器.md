# 控制器Controller

## 流程

### 定义控制器

Artisan 命令:

```bash
php atrisan make:controller <ControllerName>
```

创建的控制器类在`/app/Http/Controllers`文件夹中, 控制器类默认继承`Controller`类 ; 

### 注册路由

注册路由后可以使用控制器中的方法, 注册方式:

```php
Route::get('uri', 'UserController@show');
```

如此即可将回调设置为`UserController::show()`

注册路由时设置的参数也可以传入控制器

## 其他

### 单动作控制器

在控制器中定义`__invock`方法即可定义只处理一个动作的控制器

如此注册路由时不需要指定方法

原理是在PHP中尝试以调用函数方式调用一个对象时, `__invoke()`方法会被自动调用