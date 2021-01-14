#### HTTP/HTTPS 协议  
```  
➜ ssh -fNTR 1234:localhost:8888 root@VPS_IP  
  
➜ ssh root@VPS_IP  
  
$ export https_proxy=http://127.0.0.1:1234;export http_proxy=http://127.0.0.1:1234  
  
$ curl ipinfo.io  
{  
  "ip": "xxx.xxx.xxx.xxx",  
  "hostname": "li1733-68.members.linode.com",  
  "city": "Tokyo",  
  "region": "Tokyo",  
  "country": "JP",  
  "loc": "35.6137,139.7271",  
  "org": "AS63949 Linode, LLC",  
  "postal": "141-0033",  
  "timezone": "Asia/Tokyo",  
  "readme": "https://ipinfo.io/missingauth"  
}  
```  
  
#### SOCK5 协议  
```  
➜ ssh -fNTR 1234:localhost:8889 root@VPS_IP  
  
➜ ssh root@VPS_IP  
  
$ curl -x socks5h://localhost:1234 ipinfo.io  
{  
  "ip": "xxx.xxx.xxx.xxx",  
  "hostname": "li1836-185.members.linode.com",  
  "city": "Tokyo",  
  "region": "Tokyo",  
  "country": "JP",  
  "loc": "35.6895,139.6917",  
  "org": "AS63949 Linode, LLC",  
  "postal": "151-0052",  
  "timezone": "Asia/Tokyo",  
  "readme": "https://ipinfo.io/missingauth"  
}  
  
$ git config --global http.proxy 'socks5://127.0.0.1:1234'  
  
$ git clone https://github.com/JamesHopbourn/learn-linux-command  
Cloning into 'learn-linux-command'...  
remote: Enumerating objects: 100, done.  
remote: Counting objects: 100% (100/100), done.  
remote: Compressing objects: 100% (69/69), done.  
remote: Total 1127 (delta 62), reused 69 (delta 31), pack-reused 1027  
Receiving objects: 100% (1127/1127), 5.91 MiB | 781.00 KiB/s, done.  
Resolving deltas: 100% (665/665), done.  
```  
  
#### 相关文章  
[SSH高级用法隧道](https://note.yuchaoshui.com/blog/post/yuziyue/SSH%E5%86%85%E7%BD%91%E7%A9%BF%E9%80%8F#title-5)  
[SSH 端口转发简明教程](https://sspai.com/post/61641)  
[SSH隧道：内网穿透实战](https://cherrot.com/tech/2017/01/08/ssh-tunneling-practice.html)  
[articles/2019-05-28-ssh-port-forwarding.Markdown at master · ruanyf/articles · GitHub](https://github.com/ruanyf/articles/blob/master/2019/2019-05-28-ssh-port-forwarding.md)  
[使用SSH反向隧道进行内网穿透](http://arondight.me/2016/02/17/%E4%BD%BF%E7%94%A8SSH%E5%8F%8D%E5%90%91%E9%9A%A7%E9%81%93%E8%BF%9B%E8%A1%8C%E5%86%85%E7%BD%91%E7%A9%BF%E9%80%8F/)  
[利用ssh/socat做内网穿透(udp)](https://www.goalan.net/2018/05/03/%E5%88%A9%E7%94%A8ssh%E5%92%8Csocat%E5%81%9A%E5%86%85%E7%BD%91%E7%A9%BF%E9%80%8F/)  
