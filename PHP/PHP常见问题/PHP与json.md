# PHP与json

php解析json使用的是`json_decode()`函数，解析失败时会返回`false`

失败原因中有一个不在文档解决方案中的问题是：json字符串的**BOM头**

BOM头是UTF-8编码来向编译器指明是UTF-8编码。它的编码是`\xEF\xBB\xBF`

因此在PHP解析前，需要去除BOM头：

```php
$result = trim($result, "\xEF\xBB\xBF");
```

