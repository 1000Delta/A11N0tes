# Laravel中间件

## 定义中间件

使用`Artisan`命令`make:middleware`

```php
php artisan make:middleware <MiddlewareName>
```

命令会在`/app/Http/Middleware`目录下创建一个新的中间件类

中间件包含一个handle方法, 用来接收request请求

```php
public function handle($request, Closure $next) {
    
    // 请求前执行动作
    $response = $next($request);
    // 请求后执行动作
    return $response;
}
```

通过调整代码位置可以改变中间件执行任务的时间段





## 应用中间件

1. 在`app/Http/Kernal`中对不同中间件组应用中间件
2. 在路由中对不同组应用中间件