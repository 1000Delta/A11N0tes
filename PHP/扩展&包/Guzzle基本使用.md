# Guzzle基本使用

## 发送一个请求

```php
<?php
$base_uri = 'www.target.com';
$client = new Guzzle\Http\Client($base_uri);
$request = $client->request('GET', 'foo');

?>
```

