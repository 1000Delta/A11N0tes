# curl 函数

## `curl_init`

---

(PHP 4 >= 4.0.2, PHP 5, PHP 7)

curl_init — 初始化 cURL 会话

### 说明： 

---

```php
resource curl_init ([ string $url = NULL ])
```

初始化新的会话，返回 cURL 句柄，供 `curl_setopt()`, curl_exec() 和 curl_close() 函数使用。

### 参数

---

**`url`**

如果提供了该参数，`CURLOPT_URL` 将会被设置这个值。你也可以使用 `curl_setopt()` 函数手动地设置这个值。

### 返回值

---

如果成功，返回 cURL 句柄，出错返回 `FALSE`

## `curl_setopt`

---

(PHP 4 >= 4.0.2, PHP 5, PHP 7)

curl_setopt — 设置 cURL 传输选项

### 说明

---

```php
bool curl_setopt ( resource $ch, int $option, mixed $value )
```

### 参数

---

**`ch`**  
由 `curl_init() 返回的 cURL 句柄。

**`option`**  
需要设置的 *CURLOPT_XXX* 选项。

**`value`**  
将设置在 **`option`** 选项上的值。


## GET请求

```php
$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, $url);
curl_setopt($ch, CURL_RETURNTANSFER, 1);
$rs = curl_exec($ch);
```

## POST请求

```php
$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, $url);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
curl_setopt($ch, CURLOPT_POST, 1);
curl_setopt($ch, CURLOPT_POSTFIELD, http_build_query($data));
//bttp_build_query() 将data数组转化成http参数字符串格式
```

## cookie模拟登陆

```php
//设置cURL句柄的cookie
curl_setopt($ch, CURLOPT_COOKIE, $val)
//将获取的cookie保存到文件中
curl_setopt($ch, CURLOPT_COOKIEFILE, $filename)
//

## 