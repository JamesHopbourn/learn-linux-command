#### 查看 Surge/Shadowsocks 开放端口  
```  
➜ scutil --proxy|sed -n '/Port/p'  
  HTTPPort : 8888  
  HTTPSPort : 8888  
  SOCKSPort : 8889  
```  

#### 配置 SSH 设置心跳检测
```
➜ sudo sed -i 's/#ClientAliveInterval 0/ClientAliveInterval 30/' /etc/ssh/sshd_config
➜ sudo sed -i 's/#ClientAliveCountMax 3/ClientAliveCountMax 6/'  /etc/ssh/sshd_config
```
  
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
```  
  
#### 配置 git sock5 代理  
```  
$ git config --global http.proxy 'socks5://127.0.0.1:1234'  
```  
  
#### 检查配置是否成功  
```  
➜ git config --get http.proxy  
socks5://127.0.0.1:8889  
```  
  
#### git clone 测试  
```  
$ git clone https://github.com/JamesHopbourn/learn-linux-command  
Cloning into 'learn-linux-command'...  
remote: Enumerating objects: 100, done.  
remote: Counting objects: 100% (100/100), done.  
remote: Compressing objects: 100% (69/69), done.  
remote: Total 1127 (delta 62), reused 69 (delta 31), pack-reused 1027  
Receiving objects: 100% (1127/1127), 5.91 MiB | 781.00 KiB/s, done.  
Resolving deltas: 100% (665/665), done.  
```  
#### SSH 配置 sock5 代理  
```  
$ vim ~/.ssh/config  
Host *  
  AddKeysToAgent yes  
  ProxyCommand nc -X 5 -x 127.0.0.1:8889 %h %p  
  
$ vim ~/.zshrc  
sgcl(){  
  url=$(pbpaste|sed 's/https:\/\/github.com\//ssh:\/\/james\//')  
  git clone $url ~/Documents/$(basename $(pbpaste)) && cd ~/Documents/$(basename $(pbpaste))  
}  
  
$ sgcl  
Cloning into '/Users/james/Documents/learn-linux-command'...  
remote: Enumerating objects: 130, done.  
remote: Counting objects: 100% (130/130), done.  
remote: Compressing objects: 100% (90/90), done.  
remote: Total 1157 (delta 81), reused 89 (delta 40), pack-reused 1027  
Receiving objects: 100% (1157/1157), 5.91 MiB | 2.01 MiB/s, done.  
Resolving deltas: 100% (684/684), done.  
```  
  
#### 报错解决  
```  
➜ ssh -fNTR 1234:localhost:8889 root@VPS_IP  
Warning: remote port forwarding failed for listen port 1234  
  
原因：1234 端口已被占用
方法一：换一个端口试试。

方法二：结束占用 1234 端口的进程
➜ ps -e|grep ssh
  722 ??         0:00.28 ssh-agent -s
10667 ??         0:00.00 ssh -o ServerAliveInterval 30 -fNTR 1234:localhost:8888 root@128.199.173.144
10859 ttys001    0:00.01 grep --color=auto --exclude-dir=.bzr --exclude-dir=CVS --exclude-dir=.git --exclude-dir=.hg --exclude-dir=.svn --exclude-dir=.idea --exclude-dir=.tox ssh

➜ kill -9 10667
```  
  
#### 相关文章  
[SSH高级用法隧道](https://note.yuchaoshui.com/blog/post/yuziyue/SSH%E5%86%85%E7%BD%91%E7%A9%BF%E9%80%8F#title-5)  
[SSH 端口转发简明教程](https://sspai.com/post/61641)  
[SSH隧道：内网穿透实战](https://cherrot.com/tech/2017/01/08/ssh-tunneling-practice.html)  
[articles/2019-05-28-ssh-port-forwarding.Markdown at master · ruanyf/articles · GitHub](https://github.com/ruanyf/articles/blob/master/2019/2019-05-28-ssh-port-forwarding.md)  
[使用SSH反向隧道进行内网穿透](http://arondight.me/2016/02/17/%E4%BD%BF%E7%94%A8SSH%E5%8F%8D%E5%90%91%E9%9A%A7%E9%81%93%E8%BF%9B%E8%A1%8C%E5%86%85%E7%BD%91%E7%A9%BF%E9%80%8F/)  
[利用ssh/socat做内网穿透(udp)](https://www.goalan.net/2018/05/03/%E5%88%A9%E7%94%A8ssh%E5%92%8Csocat%E5%81%9A%E5%86%85%E7%BD%91%E7%A9%BF%E9%80%8F/)  
