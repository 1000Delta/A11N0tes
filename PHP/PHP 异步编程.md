# PHP 异步编程

## 回调

```php
array_walk(&$array, $callback, $userdata)
```

将会对数组的每一个元素执行回调

回调函数默认需要两个参数，第一个是array中的值，第二个是相应的键名，如果要对array内部的值进行修改，需要制定回调函数的第一个参数为引用类型。

如果有第三个参数`userdata`传入，则会作为第三个参数传入回调函数

## 事件监听

> PHP有很多扩展和包提供了这方面的支持：
>
> [ext-libevent](http://php.net/manual/zh/book.libevent.php) libevent扩展，基于libevent库，支持异步IO和时间事件
>
> ext-event event扩展，支持异步IO和时间事件
>
> [ext-libev](http://php.net/manual/zh/book.ev.php) libev扩展，基于libev库，支持异步IO和时间事件
>
> [ext-eio](http://php.net/manual/zh/book.eio.php) eio扩展，基于eio库，支持磁盘异步操作
>
> [ext-swoole](http://www.swoole.com/) swoole扩展，支持异步IO和时间，方便编写异步socket服务器，推荐使用
>
> [package-react](https://github.com/reactphp/react) react包，提供了全面的异步编程方式，包括IO、时间事件、磁盘IO等等
>
> [package-workerman](http://www.workerman.net/) workerman包，类似swoole，php编写



## 发布/订阅

> 使用nsq-php扩展

## Promise

