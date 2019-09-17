# HTTP 请求

## `Illuminate\Http\Request`类

### 属性

#### 动态属性

输入值会添加到动态属性

### 方法

`path()`

返回请求的路径信息(域名后的字段)

`url()`

返回完整的URL(不包含查询字符串)

`fullUrl()`

返回包含查询字符串的完整URL

`method()`

返回 HTTP 请求的方式

`all()`

以数组格式获取所有输入值

`input($key[, $val])`

获取$`key`为键名的输入值, 可选参数是默认值, 当指定键名在整个**请求负载**(GET & POST)中未出现时, 将会返回默认值.

当处理表单数组输入时, 可以使用`.`来访问数组输入.

`query([$key[, $val]])`

从**查询字符串**中获取数值(GET)

无参数时返回所有查询字符串中的参数, 类似于`all()` , 其余用法同`input()`.

`post([$key[, $val]])`

从**request请求**中获取输入值(POST)

用法同`query()`.

`only()` 返回你需要取出的输入数据的子集

可以接收一个`$key`构成的数组或者动态参数列表

`except()`  返回除了你指定的key之外的子集

参数同上

`flash()` `将当前输入存放到一次性Session中(一次性Session指的是将数据取出后对应数据会在Session中被销毁).

`flashOnly()`

`flashExcept()`

将输入子集存放到Session中

`cookie($key)`  同 `Cookie::get($key)`

从请求中取出指定cookie

`old($key)`

从Session中取出一次性数据

## request相关操作

#### 获取请求

若要在控制器中获取请求, 需要在方法中对`Illuminate\Http\Request`类中进行依赖注入, 这样当前请求示例会被服务容器自动注入.

如果还需要在控制器方法中获取路由参数,只需要将参数置于其他依赖之后即可.

在路由闭包中注入`Illuminate\Http\Request`同理.

#### 获取JSON输入值

在发送数据到应用时将`Content-Type`请求头设置为`application/json`,就可以通过`input()`方法获取数据

#### 将输入数据存储到Session然后重定向

调用`redirect()->withInput()`来实现

```php
return redirect('form')->withInput();
```

```php
return redirect('form')->withInput($request->except('password'));
```



# HTTP 响应

## `Illuminate\Http\Response`类

继承自`Symfony\Component\Httpfondation\Response` 基类.

大部分响应方法都可以以方法链的形式调用, 从而可以流式构建响应:

```php
return response($content)
    ->header('Content-Type', $type)
    ->header('X-Header-One', 'Header Value')
    ->header('X-Header-Two', 'Header Value');
```

### 属性

### 方法

`header($key, $val)`

自定义响应的头信息.

可以以方法链的形式调用.

`cookie($key, $val, $min[, ...])`

添加cookie到响应, `$min`是持续时间

##  重定向

...

## response相关操作

#### Cookie加密

通过 `app/Http/Middleware` 目录下的中间件 `App\Http\Middleware\EncryptCookies`提供的 `$except` 属性来排除这些 Cookie