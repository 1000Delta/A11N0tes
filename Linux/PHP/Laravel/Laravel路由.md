# Laravel路由

默认路由文件

`routes/web.php`

`routes/api.php`



路由方法

```php
Route::get($uri, $callback); Route::post($uri, $callback); Route::put($uri, $callback); Route::patch($uri, $callback); Route::delete($uri, $callback); Route::options($uri, $callback);
```

次级方法

```php
Route::get()->where(); // 正则约束
Route::get()->name(); // 命名路由
```





## 路由参数

### 必选参数

例:

```php
Route::get('user/{id}', function ($id) {
    
    return $id;
});
```

### 可选参数

在参数后加`?`, 即`{id?}`, 如此在回调函数中需要设置参数的默认值

### 正则约束

`Route::{request}->where('paramName', 'regexPartten')` 约束单个参数

`Route::{request}->where(['param1' => 'regex1', 'param2' => 'regex2'])` 约束多个参数，使用数组进行

#### 全局约束

如果想要参数在全局被约束，那么需要在`RouteServiceProvider`类的`boot`方法中定义约束模式：

```php
public function boot () {
    
    Route::pattern('id', '[0-9]+');
    parent::boot();
}
```

约束对于所有的参数项`{id}`都生效

### 命名路由

为生成 URL 或重定向提供了方便

```php
Route::get('user/profile', function () { // 通过路由名称生成 URL return 'my url: ' . route('profile');
})->name('profile');
```

