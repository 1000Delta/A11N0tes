# **Docker多容器构建LaravelDocker多容器构建Laravel**

## 实验方式

由于使用多容器，需要在不同容器间进行通信，使用端口映射过于麻烦，所以使用网桥（bridge）方式进行构建，便于应用内部进行通信。

创建网络：

```powershell
docker network create -d bridge laravel
```

创建相应容器：

Nginx：

```powershell
docker run -p 80:80 -v D:\tmp\nginx\conf.d\:/etc/nginx/conf.d -v D:\DeltaX\Documents\Codes\Projects\XTUSearch:/www -itd --name laravel-nginx --network laravel nginx:1.15.8
```

其中Nginx配置文件映射到本地文件夹方便修改，应用根目录映射到创建应用的目录。

php-fpm：

```powershell
docker run -itd -v D:\DeltaX\Documents\Codes\Projects\XTUSearch:/www --network laravel --name laravel-php php:7.2-fpm
```

应用根目录需要分别映射到两个容器中，否则会出现`file not found`问题

nginx配置文件：

```properties
server {
    listen       80;
    server_name  localhost;
    root   /www/public;
    index  index.php index.html index.htm;

    #charset koi8-r;
    #access_log  /var/log/nginx/host.access.log  main;

    location / {
        try_files $uri $uri/ /index.php?$query_string;
    }

    #error_page  404              /404.html;

    # redirect server error pages to the static page /50x.html
    #
    error_page   500 502 503 504  /50x.html;
    location = /50x.html {
        root   /usr/share/nginx/html;
    }

    # proxy the PHP scripts to Apache listening on 127.0.0.1:80
    #
    #location ~ \.php$ {
    #    proxy_pass   http://127.0.0.1;
    #}

    # pass the PHP scripts to FastCGI server listening on 127.0.0.1:9000
    #
    location ~ \.php$ {
    #    root           html;
       fastcgi_pass   laravel-php:9000;
       fastcgi_index  index.php;
       fastcgi_param  SCRIPT_FILENAME  $document_root$fastcgi_script_name;
       include        fastcgi_params;
    }

    # deny access to .htaccess files, if Apache's document root
    # concurs with nginx's one
    #
    #location ~ /\.ht {
    #    deny  all;
    #}
}


```

其中，php地址可以使用容器名，已经映射到对应内网地址