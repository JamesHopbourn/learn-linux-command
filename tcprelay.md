#### 下载 usbmuxd
```
curl -o usbmuxd-1.0.8 https://cgit.sukimashita.com/usbmuxd.git/snapshot/usbmuxd-1.0.8.tar.gz

tar xf usbmuxd-1.0.8.tar

cp usbmuxd-1.0.8/python-client/* ./
```

#### Port forward
```
➜ python tcprelay.py -t 22:2222
Forwarding local port 2222 to remote port 22
Incoming connection to 2222
Waiting for devices...
Connecting to device <MuxDevice: ID 45 ProdID 0x1297 Serial '1da41acc0d2a7b49dc2ae82bea47f4c0691e9f4f' Location 0x14100000>
```

#### SSH over USB
```
➜ ssh root@localhost -p 2222
The authenticity of host '[localhost]:2222 (<no hostip for proxy command>)' can't be established.
RSA key fingerprint is SHA256:M8d0YLjVSbKxl4bqRWHKbPsC22o9vNVASdBhHo55BW8.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added '[localhost]:2222' (RSA) to the list of known hosts.
root@localhost's password:
jamesde-iPhone:~ root#
```

#### SSH 免密登陆
```
➜ ssh-copy-id root@localhost -p 2222
/usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed
/usr/bin/ssh-copy-id: INFO: 1 key(s) remain to be installed -- if you are prompted now it is to install the new keys
root@localhost's password:

Number of key(s) added: 1

Now try logging into the machine, with:   "ssh -p '2222' 'root@localhost'"
and check to make sure that only the key(s) you wanted were added.
```

#### scp over USB
```
➜ scp -P 2222 /Users/james/Desktop/main root@localhost:/var/root/
main                                100%  144KB 219.0KB/s   00:00

➜ scp -P 2222 root@localhost:/var/root/main /Users/james/Desktop/
main                                100%  144KB   3.6MB/s   00:00
```