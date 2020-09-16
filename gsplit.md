#### 安装 GNU split 替换 macOS 自带的 BSD split
```
➜ brew install coreutils
```

#### 生成 100KB 测试文件
```
➜ dd if=/dev/zero bs=100k count=1 of=test
1+0 records in
1+0 records out
102400 bytes transferred in 0.000267 secs (383479223 bytes/sec)
```

#### 记录测试文件 md5
```
➜ md5 test
MD5 (test) = 4c6426ac7ef186464ecbb0d81cbfcb1e
```

#### 按照每 10KB 进行分隔
```
➜ gsplit -b 10k test
test xaa xab xac xad xae xaf xag xah xai xaj
```

#### 按照每 10KB 进行分隔 加上 prefix 前缀
```
➜ gsplit -b 10k test prefix
prefixaa prefixab prefixac prefixad prefixae
prefixaf prefixag prefixah prefixai prefixaj
```

#### 按照每 10KB 进行分隔 加上 prefix 前缀和 .dat 后缀
```
➜ gsplit -b 10k test prefix --additional-suffix=.dat
prefixaa.dat prefixab.dat prefixac.dat prefixad.dat prefixae.dat
prefixaf.dat prefixag.dat prefixah.dat prefixai.dat prefixaj.dat
```
#### 按照每 10KB 进行分隔 加上 prefix 前缀和 .txt 后缀
```
➜ gsplit -b 10k test prefix --additional-suffix=.txt
prefixaa.txt prefixab.txt prefixac.txt prefixad.txt prefixae.txt
prefixaf.txt prefixag.txt prefixah.txt prefixai.txt prefixaj.txt
```

#### 按照每 10KB 进行分隔 加上 Number 前缀和三位数后缀
```
➜ gsplit -b 10k test Number -d -a 3
Number000 Number001 Number002 Number003 Number004
Number005 Number006 Number007 Number008 Number009
```

#### 按照每 10KB 进行分隔 加上 Files 前缀和四位数后缀
```
➜ gsplit -b 10k test Files -d -a 4
Files0000 Files0001 Files0002 Files0003 Files0004
Files0005 Files0006 Files0007 Files0008 Files0009
```

#### 合并 Files 开头的文件保存为 restore
```
➜ cat Files* > restore
```

#### 检查 md5 对比发现未发生改变
```
➜ md5 restore
MD5 (restore) = 4c6426ac7ef186464ecbb0d81cbfcb1e
```

#### 新建文件 text.txt
```
➜ vim text.txt
第一行
第二行
第三行
第四行
第五行
[ESC] :wq
```

#### 按照每个文件一行进行分隔，并加上 TXT 前缀
```
➜ gsplit -l 1 text.txt -d -a 3 TXT
```

#### 查看以 TXT 前缀开头的文件
```
➜ cat TXT*
第一行
第二行
第三行
第四行
第五行
```

#### 新建 1GB 随机数据文件 命名为 Movie.mp4
```
➜ dd if=/dev/zero of=Movie.mp4 bs=1g count=1
1+0 records in
1+0 records out
1073741824 bytes transferred in 19.080173 secs (56275267 bytes/sec)
```

#### 按照每个文件 100MB 进行分隔 加上 Movie_Part 前缀
```
➜ gsplit -C 100M -d Movie.mp4 Movie_Part
Movie_Part00 Movie_Part01 Movie_Part02 Movie_Part03 Movie_Part04
Movie_Part05 Movie_Part06 Movie_Part07 Movie_Part08 Movie_Part09
```

#### 总结
```
gsplit (-b/-l/-M) 原始文件 前缀文字 (-d -a 数字位数) --additional-suffix=.(后缀格式) 
```

1. -b/-l/-M：-b 用于处理二进制文件，-l 用于处理纯文本指定分隔行树，-M 用于处理其他文件按照指定大小进行分隔
2. -d -a 数字位数：默认是两位数字，可以根据需要改成 3 或者 4，如果不使用这个选项，默认使用 aa-zz 添加文件后缀
3. --additional-suffix=：可以根据需要自行添加后缀，例如 txt、mov
4. macOS 上默认的 dd 命令生成文件大小必须使用小写字母，例如：b、k、m、g