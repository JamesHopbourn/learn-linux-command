#### 下载 usbmuxd
```
curl -o usbmuxd-1.0.8 https://cgit.sukimashita.com/usbmuxd.git/snapshot/usbmuxd-1.0.8.tar.gz

tar xf usbmuxd-1.0.8.tar

cp usbmuxd-1.0.8/python-client/* ./
```

#### Port forward
```
python tcprelay.py -t 22:2222
Forwarding local port 2222 to remote port 22
Incoming connection to 2222
Waiting for devices...
Connecting to device <MuxDevice: ID 45 ProdID 0x1297 Serial '1da41acc0d2a7b49dc2ae82bea47f4c0691e9f4f' Location 0x14100000>
```

#### SSH over USB
```
ssh root@localhost -p 2222
```

#### SSH 免密登陆
```
ssh-copy-id root@localhost -p 2222
```

#### scp over USB
```
scp -P 2222 /Users/james/Desktop/main root@localhost:/var/root/

scp -P 2222 root@localhost:/var/root/main /Users/james/Desktop/
```