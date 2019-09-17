# Session

## 全局 Session 辅助函数 `session()`

```php
// 从 Session 中获取数据
$value = session('key');
// 指定默认值
$value = session('key', 'default');
// 存储数据到session
session(['key' => 'value']);
```

## `Illuminate\Http\Request` 类中 `session()`方法

通过`$request->session()->{method}()来调用

`all()`

获取所有数据

`has($key)`

检查数据项在Session中是否存在,如果存在并且值不为`null`则返回`true`

`exist($key)`

功能同上, 但是仅判断是否存在,不判断值

`put($key, $val)` 存储数据

`push('user.teams', 'developers')` 推送数据到值为数组的Session

`pull('key', 'default')` 从Session获取并删除数据

`flash('key', 'val')` 存储一次性数据

`reflash()` 将一次性数据保存到下一个请求(多保留一次)

`keep(['key1', 'key2'])` 保留特定一次性数据

`regenerate()` 重新生成sessionID