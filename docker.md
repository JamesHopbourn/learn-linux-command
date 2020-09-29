#### 安装 Nginx
```
docker pull nginx:latest
docker images
docker run --name nginx-test -p 8080:80 -d nginx
```

#### 安装 PHP
```
docker pull php:5.6-fpm
docker images
docker run --name myphp-fpm -v ~/nginx/www:/www -d php:5.6-fpm
mkdir -p ~/nginx/conf/conf.d
vim ~/nginx/conf/conf.d/runoob-test-php.conf
server {
    listen       80;
    server_name  localhost;

    location / {
        root   /usr/share/nginx/html;
        index  index.html index.htm index.php;
    }

    error_page   500 502 503 504  /50x.html;
    location = /50x.html {
        root   /usr/share/nginx/html;
    }

    location ~ \.php$ {
        fastcgi_pass   php:9000;
        fastcgi_index  index.php;
        fastcgi_param  SCRIPT_FILENAME  /www/$fastcgi_script_name;
        include        fastcgi_params;
    }
}

[ESC] :wq

vim ~/nginx/www/index.php
<?php
echo phpinfo();
?>

[ESC] :wq

docker run --name runoob-php-nginx -p 8083:80 -d \
    -v ~/nginx/www:/usr/share/nginx/html:ro \
    -v ~/nginx/conf/conf.d:/etc/nginx/conf.d:ro \
    --link myphp-fpm:php \
    nginx

open http://127.0.0.1:8083/index.php
```