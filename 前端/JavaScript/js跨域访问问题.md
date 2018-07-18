# js跨域访问问题

>  js跨域访问提示错误：XMLHttpRequest cannot load http://...... No 'Access-Control-Allow-Origin' header is present on the requested resource. Origin 'null' is therefore not allowed access.

解决方法：

1、如果请求的url是aspx页面，则需要在aspx页面中添加代码：Response.AddHeader("Access-Control-Allow-Origin", "*");

2、如果请求的url是PHP页面，则需要在PHP页面中添加代码：header("Access-Control-Allow-Origin: *");【本人使用的php，用此方法问题得以解决】

3、如果请求的url是静态的html页面，则需要在页面中添加meta标签代码：<meta http-equiv="Access-Control-Allow-Origin" content="*" />

如果服务器端可以确定是要被哪些域名访问，最好是能把以上代码中的“*”代替为具体的域名，这样做可以相应的增强安全性。