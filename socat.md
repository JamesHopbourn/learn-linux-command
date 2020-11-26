#### 本地端口转发
```
➜ socat -d TCP4-LISTEN:6666,reuseaddr,fork TCP4:127.0.0.1:8889

➜ curl --proxy socks5h://127.0.0.1:6666 -v ipinfo.io
*   Trying 127.0.0.1...
* TCP_NODELAY set
* SOCKS5 communication to ipinfo.io:80
* SOCKS5 request granted.
* Connected to 127.0.0.1 (127.0.0.1) port 6666 (#0)
> GET / HTTP/1.1
> Host: ipinfo.io
> User-Agent: curl/7.64.1
> Accept: */*
>
< HTTP/1.1 200 OK
< Date: Mon, 23 Nov 2020 16:37:11 GMT
< Content-Type: application/json; charset=utf-8
< Content-Length: 240
< Vary: Accept-Encoding
< X-Powered-By: Express
< Access-Control-Allow-Origin: *
< X-Frame-Options: DENY
< X-XSS-Protection: 1; mode=block
< X-Content-Type-Options: nosniff
< Referrer-Policy: strict-origin-when-cross-origin
< Set-Cookie: flash=; Path=/; Expires=Thu, 01 Jan 1970 00:00:00 GMT
< Via: 1.1 google
< Expires: Mon, 23 Nov 2020 16:37:11 GMT
< Cache-Control: private
<
{
  "ip": "45.66.135.165",
  "city": "Tokyo",
  "region": "Tokyo",
  "country": "JP",
  "loc": "35.6210,139.7463",
  "org": "AS9009 M247 Ltd",
  "postal": "140-0002",
  "timezone": "Asia/Tokyo",
  "readme": "https://ipinfo.io/missingauth"
* Connection #0 to host 127.0.0.1 left intact
}* Closing connection 0
```

#### 匿名性测试环境搭建
```
➜ vim wp587uxedt2a5d6a.php

<?php
$array = array('HTTP_USER_AGENT', 'HTTP_HOST', 'HTTP_ACCEPT', 'PATH', 'SERVER_SIGNATURE', 'SERVER_SOFTWARE', 'SERVER_NAME', 'SERVER_ADDR', 'SERVER_PORT', 'DOCUMENT_ROOT', 'SERVER_ADMIN', 'SCRIPT_FILENAME', 'REMOTE_PORT', 'GATEWAY_INTERFACE', 'SERVER_PROTOCOL', 'REQUEST_METHOD', 'QUERY_STRING', 'REQUEST_URI', 'SCRIPT_NAME', 'PHP_SELF', 'REQUEST_TIME');
$srv = $_SERVER;
foreach($array as $name ) {
    unset($srv[ $name ]);
}
print_r($srv);
```

#### 直接访问
```
➜ curl https://qwq.cnnic.ml/wp587uxedt2a5d6a.php
Array
(
    [USER] => www
    [HOME] => /home/www
    [HTTP_CDN_LOOP] => cloudflare
    [HTTP_CF_CONNECTING_IP] => 112.51.198.214
    [HTTP_CF_REQUEST_ID] => 069c80684000002139d71da000000001
    [HTTP_CF_VISITOR] => {"scheme":"https"}
    [HTTP_X_FORWARDED_PROTO] => https
    [HTTP_CF_RAY] => 5f743686cca32139-SJC
    [HTTP_X_FORWARDED_FOR] => 112.51.198.214
    [HTTP_CF_IPCOUNTRY] => CN
    [HTTP_ACCEPT_ENCODING] => gzip
    [HTTP_CONNECTION] => Keep-Alive
    [PATH_INFO] =>
    [PHP_ADMIN_VALUE] => open_basedir=/home/wwwroot/qwq.cnnic.ml/:/tmp/:/proc/
    [REDIRECT_STATUS] => 200
    [REMOTE_ADDR] => 172.68.143.58
    [REQUEST_SCHEME] => http
    [DOCUMENT_URI] => /wp587uxedt2a5d6a.php
    [CONTENT_LENGTH] =>
    [CONTENT_TYPE] =>
    [FCGI_ROLE] => RESPONDER
    [REQUEST_TIME_FLOAT] => 1606232265.1001
)

➜ curl http://ip-api.com/json/112.51.198.214|jq
{
  "status": "success",
  "country": "China",
  "countryCode": "CN",
  "region": "GD",
  "regionName": "Guangdong",
  "city": "Guangzhou",
  "zip": "",
  "lat": 23.1291,
  "lon": 113.264,
  "timezone": "Asia/Shanghai",
  "isp": "China Mobile",
  "org": "China Mobile Communications Corporation",
  "as": "AS9808 Guangdong Mobile Communication Co.Ltd.",
  "query": "112.51.198.214"
}
```

#### 代理访问
```
curl --proxy socks5h://127.0.0.1:8889 https://qwq.cnnic.ml/wp587uxedt2a5d6a.php
Array
(
    [USER] => www
    [HOME] => /home/www
    [HTTP_CDN_LOOP] => cloudflare
    [HTTP_CF_CONNECTING_IP] => 45.66.135.165
    [HTTP_CF_REQUEST_ID] => 069cc493f5000094d94c174000000001
    [HTTP_CF_VISITOR] => {"scheme":"https"}
    [HTTP_X_FORWARDED_PROTO] => https
    [HTTP_CF_RAY] => 5f74a3998bab94d9-NRT
    [HTTP_X_FORWARDED_FOR] => 45.66.135.165
    [HTTP_CF_IPCOUNTRY] => JP
    [HTTP_ACCEPT_ENCODING] => gzip
    [HTTP_CONNECTION] => Keep-Alive
    [PATH_INFO] =>
    [PHP_ADMIN_VALUE] => open_basedir=/home/wwwroot/qwq.cnnic.ml/:/tmp/:/proc/
    [REDIRECT_STATUS] => 200
    [REMOTE_ADDR] => 162.158.119.225
    [REQUEST_SCHEME] => http
    [DOCUMENT_URI] => /wp587uxedt2a5d6a.php
    [CONTENT_LENGTH] =>
    [CONTENT_TYPE] =>
    [FCGI_ROLE] => RESPONDER
    [REQUEST_TIME_FLOAT] => 1606236732.4891
)

➜ curl http://ip-api.com/json/45.66.135.165|jq
{
  "status": "success",
  "country": "Japan",
  "countryCode": "JP",
  "region": "13",
  "regionName": "Tokyo",
  "city": "Tokyo",
  "zip": "140-0001",
  "lat": 35.6212,
  "lon": 139.747,
  "timezone": "Asia/Tokyo",
  "isp": "M247 Ltd",
  "org": "Think Huge Ltd",
  "as": "AS9009 M247 Ltd",
  "query": "45.66.135.165"
}
```