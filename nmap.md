### nmap
#### SSL 证书查看
```
nmap -p 443 --script ssl-cert baidu.com

Starting Nmap 7.80 ( https://nmap.org ) at 2020-10-24 08:54 CST
Nmap scan report for baidu.com (220.181.38.148)
Host is up (0.040s latency).
Other addresses for baidu.com (not scanned): 39.156.69.79

PORT    STATE SERVICE
443/tcp open  https
| ssl-cert: Subject: commonName=www.baidu.cn/organizationName=BeiJing Baidu Netcom Science Technology Co., Ltd/stateOrProvinceName=Beijing/countryName=CN
| Subject Alternative Name: DNS:baidu.cn, DNS:baidu.com, DNS:baidu.com.cn, DNS:w.baidu.com, DNS:ww.baidu.com, DNS:www.baidu.com.cn, DNS:www.baidu.com.hk, DNS:www.baidu.hk, DNS:www.baidu.net.au, DNS:www.baidu.net.ph, DNS:www.baidu.net.tw, DNS:www.baidu.net.vn, DNS:wwww.baidu.com, DNS:wwww.baidu.com.cn, DNS:www.baidu.cn
| Issuer: commonName=DigiCert SHA2 Secure Server CA/organizationName=DigiCert Inc/countryName=US
| Public Key type: rsa
| Public Key bits: 2048
| Signature Algorithm: sha256WithRSAEncryption
| Not valid before: 2020-02-27T00:00:00
| Not valid after:  2021-02-26T12:00:00
| MD5:   d0cf b084 759f 231b 9b22 c197 6bd5 d271
|_SHA-1: e357 f6c5 b7d3 7464 8055 89c9 3797 c98d 9d38 2497

Nmap done: 1 IP address (1 host up) scanned in 0.64 seconds
```

#### 扫描局域网
```
 nmap 192.168.10.0/24
Starting Nmap 7.80 ( https://nmap.org ) at 2020-07-24 21:33 CST
Nmap scan report for 192.168.10.1
Host is up (0.013s latency).
Not shown: 998 filtered ports
PORT     STATE SERVICE
80/tcp   open  http
1900/tcp open  upnp

Nmap scan report for 192.168.10.101
Host is up (0.00052s latency).
Not shown: 995 closed ports
PORT      STATE SERVICE
22/tcp    open  ssh
80/tcp    open  http
8888/tcp  open  sun-answerbook
49152/tcp open  unknown
49176/tcp open  unknown

Nmap scan report for 192.168.10.102
Host is up (0.027s latency).
Not shown: 996 filtered ports
PORT    STATE SERVICE
80/tcp  open  http
135/tcp open  msrpc
139/tcp open  netbios-ssn
445/tcp open  microsoft-ds

Nmap done: 256 IP addresses (3 hosts up) scanned in 41.65 seconds ``` 
#### 机器端口扫描
``` echo "EXIT" | ncat -vq 5 -n 10.211.55.6 22
Connection to 10.211.55.6 22 port [tcp/*] succeeded!
SSH-2.0-OpenSSH_7.6p1 Ubuntu-4ubuntu0.4

echo "EXIT" | ncat -vq 5 github.com 22
Connection to github.com 22 port [tcp/ssh] succeeded!
SSH-2.0-babeld-5a455904 
``` 
#### 路径扫描 
[GitHub - maurosoria/dirsearch: Web path scanner](https://github.com/maurosoria/dirsearch) 
```
 python3 dirsearch.py -u 192.168.10.102 -e php,txt,zip --threads=100

 _|. _ _  _  _  _ _|_    v0.3.9
(_||| _) (/_(_|| (_| )

Extensions:  | HTTP method: getSuffixes: php, txt, zip | HTTP method: get | Threads: 100 | Wordlist size: 6487 | Request count: 6487

Error Log: /Users/james/Desktop/dirsearch/logs/errors-20-07-24_22-11-05.log

Target: 192.168.10.102

Output File: /Users/james/Desktop/dirsearch/reports/192.168.10.102/20-07-24_22-11-05

[22:11:05] Starting:
[22:11:11] 403 -  222B  - /.htaccess-dev
[22:11:11] 403 -  224B  - /.htaccess-local
[22:11:11] 403 -  224B  - /.htaccess-marco
[22:11:11] 403 -  223B  - /.htaccess.bak1
[22:11:11] 403 -  222B  - /.htaccess.old
[22:11:11] 403 -  223B  - /.htaccess.orig
[22:11:11] 403 -  225B  - /.htaccess.sample
[22:11:11] 403 -  223B  - /.htaccess.save
[22:11:11] 403 -  222B  - /.htaccess.txt
[22:11:11] 403 -  221B  - /.htaccessBAK
[22:11:11] 403 -  221B  - /.htaccessOLD
[22:11:11] 403 -  222B  - /.htaccessOLD2
[22:11:11] 403 -  222B  - /.htpasswd-old
[22:11:11] 403 -  220B  - /.httr-oauth
[22:11:11] 403 -  215B  - /.idea/
[22:11:11] 301 -  249B  - /.idea/dictionaries  ->  http://192.168.10.102/.idea/dictionaries/
[22:11:11] 200 -  630B  - /.idea/encodings.xml
[22:11:11] 200 -  265B  - /.idea/modules.xml
[22:11:11] 200 -  179B  - /.idea/misc.xml
[22:11:12] 200 -  267B  - /.idea/vcs.xml
[22:11:12] 200 -   18KB - /.idea/workspace.xml
[22:11:17] 403 -  211B  - /%3f/
[22:11:17] 403 -  213B  - /%20../
[22:11:17] 403 -  211B  - /%ff/
[22:11:17] 200 -   17B  - /1.php
[22:11:37] 301 -  234B  - /cms  ->  http://192.168.10.102/cms/
[22:11:37] 403 -  213B  - /cms/
[22:11:38] 200 -    2KB - /composer.json
[22:11:39] 200 -  178KB - /composer.lock
[22:11:40] 301 -  234B  - /css  ->  http://192.168.10.102/css/
[22:11:43] 200 -    1KB - /dist/
[22:11:45] 200 -    1KB - /favicon.ico
[22:11:46] 301 -  236B  - /fonts  ->  http://192.168.10.102/fonts/
[22:11:48] 301 -  234B  - /img  ->  http://192.168.10.102/img/
[22:11:49] 200 -  200B  - /index.php
[22:11:50] 200 -  200B  - /index.php/login/
[22:11:51] 503 -    8KB - /jmx-console/HtmlAdaptor?action=inspectMBean&name=jboss.system:type=ServerInfo
[22:11:51] 503 -    8KB - /jmx-console/HtmlAdaptor
[22:11:51] 301 -  233B  - /js  ->  http://192.168.10.102/js/
[22:12:00] 200 -    1KB - /package.json
[22:12:02] 301 -  241B  - /phpmyadmin  ->  http://192.168.10.102/phpmyadmin/
[22:12:02] 200 -   86KB - /phpinfo.php
[22:12:03] 200 -   14KB - /phpmyadmin/
[22:12:03] 200 -    1KB - /phpunit.xml
[22:12:07] 200 -  425B  - /Server.php
[22:12:13] 200 -  266B  - /test.php
[22:12:13] 200 -  164B  - /test.txt
[22:12:13] 403 -  225B  - Trace.axd::$DATA
[22:12:17] 403 -  226B  - web.config::$DATA
[22:13:01] 200 -   85MB - /1.zip

Task Completed 
``` 

```
 python3 dirsearch.py -u http://192.168.10.102:80/.idea/  -e php,txt,zip --threads=20

 _|. _ _  _  _  _ _|_    v0.3.9
(_||| _) (/_(_|| (_| )

Extensions:  | HTTP method: getSuffixes: php, txt, zip | HTTP method: get | Threads: 20 | Wordlist size: 6487 | Request count: 6487

Error Log: /Users/james/Desktop/dirsearch/logs/errors-20-07-24_22-06-59.log

Target: http://192.168.10.102:80/.idea/

Output File: /Users/james/Desktop/dirsearch/reports/192.168.10.102/idea_20-07-24_22-06-59

[22:06:59] Starting:
[22:07:13] 403 -  228B  - /.idea/.htaccess-dev
[22:07:13] 403 -  230B  - /.idea/.htaccess-local
[22:07:13] 403 -  230B  - /.idea/.htaccess-marco
[22:07:13] 403 -  229B  - /.idea/.htaccess.bak1
[22:07:13] 403 -  228B  - /.idea/.htaccess.old
[22:07:13] 403 -  229B  - /.idea/.htaccess.orig
[22:07:13] 403 -  231B  - /.idea/.htaccess.sample
[22:07:13] 403 -  229B  - /.idea/.htaccess.save
[22:07:13] 403 -  228B  - /.idea/.htaccess.txt
[22:07:13] 403 -  227B  - /.idea/.htaccessBAK
[22:07:13] 403 -  227B  - /.idea/.htaccessOLD
[22:07:13] 403 -  228B  - /.idea/.htaccessOLD2
[22:07:13] 403 -  228B  - /.idea/.htpasswd-old
[22:07:13] 403 -  226B  - /.idea/.httr-oauth
[22:07:23] 403 -  217B  - /.idea/%3f/
[22:07:23] 403 -  219B  - /.idea/%20../
[22:07:23] 403 -  217B  - /.idea/%ff/
[22:08:28] 403 -  231B  - Trace.axd::$DATA
[22:08:32] 403 -  232B  - web.config::$DATA

Task Completed 
```     