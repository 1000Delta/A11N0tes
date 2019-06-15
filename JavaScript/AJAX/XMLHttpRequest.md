# XMLHttpRequest对象

用于和服务器进行数据交换

## 基本操作

```javascript
let xhr = new XMLHttpRequest();
xhr.open(method, url);

xhr.onload = () => alert(xhr.response);
xhr.send(data);
```

