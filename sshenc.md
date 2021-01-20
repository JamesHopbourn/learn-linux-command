#### 下载 sshenc.sh
```
➜ curl -O https://sshenc.sh/sshenc.sh
➜ chmod +x sshenc.sh
```

#### 加密文件
```
➜ sshenc.sh -p ~/.ssh/id_rsa.pub < 待加密文件.txt > 生成的加密文件.txt 
```

#### 解密文件
```
➜ sshenc.sh -s ~/.ssh/id_rsa < 加密文件.txt
```
