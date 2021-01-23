#### zip 炸弹
```
➜ dd if=/dev/zero count=$((1024*1024)) bs=10240 of=bigFile.csv
➜ zip -9 bigFile.zip bigFile.csv
```
#### 不含 MACOS 的压缩包
```
➜ zip -r compressed.zip /path/to/dir

➜ 7z a -tzip compressed.zip /path/to/dir
```
#### 图片藏压缩包
```
➜ zip output.zip test.mp3

➜ zip -P 123456 output.zip test.mp3

➜ cat test.png output.zip > final.png

➜ unzip final.png
```
#### 压缩包伪加密
```
➜ zip -r test.zip /etc/hosts
updating: IMG_5449.jpeg (deflated 3%)

➜ xxd test.zip dump

➜ cat dump|head
00000000: 504b 0304 1400 0000 0800 58bd 2852 fec4  PK........X.(R..
00000010: 760a 2d44 0300 4661 0300 0d00 1c00 494d  v.-D..Fa......IM
00000020: 475f 3534 3439 2e6a 7065 6755 5409 0003  G_5449.jpegUT...
00000030: 787d f85f 0c8e 0b60 7578 0b00 0104 f501  x}._...`ux......
00000040: 0000 0414 0000 009c bd79 4052 e9df 37cc  .........y@R..7.
00000050: 4c4d 4d39 657b 538e 32ad 56a6 4e99 3299  LMM9e{S.2.V.N.2.
00000060: ca94 95a5 9965 2aee 4c8b 2b22 4dee 8a9c  .....e*.L.+"M...
00000070: 5fd3 62ea 9853 a68e 9a52 999a 2ba6 2229  _.b..S...R..+.")
00000080: 08e5 9229 2ab9 92a0 92fb 82c8 a62c 0287  ...)*........,..
00000090: f738 f77d 3fcf f3c7 f3c7 fbbe 47d1 231e  .8.}?.......G.#.

➜ sed -i 's/0000/0900/3' dump

➜ md5 dump
MD5 (dump) = 5ca7cbfc9e727811bdcf2c290c78c8f6

➜ cat dump|head
00000000: 504b 0304 1400 0900 0800 58bd 2852 fec4  PK........X.(R..
00000010: 760a 2d44 0300 4661 0300 0d00 1c00 494d  v.-D..Fa......IM
00000020: 475f 3534 3439 2e6a 7065 6755 5409 0003  G_5449.jpegUT...
00000030: 787d f85f 0c8e 0b60 7578 0b00 0104 f501  x}._...`ux......
00000040: 0000 0414 0900 009c bd79 4052 e9df 37cc  .........y@R..7.
00000050: 4c4d 4d39 657b 538e 32ad 56a6 4e99 3299  LMM9e{S.2.V.N.2.
00000060: ca94 95a5 9965 2aee 4c8b 2b22 4dee 8a9c  .....e*.L.+"M...
00000070: 5fd3 62ea 9853 a68e 9a52 999a 2ba6 2229  _.b..S...R..+.")
00000080: 08e5 9229 2ab9 92a0 92fb 82c8 a62c 0287  ...)*........,..
00000090: f738 f77d 3fcf f3c7 f3c7 fbbe 47d1 231e  .8.}?.......G.#.

➜ xxd -r dump > test.zip

➜ open test.zip
```
#### 压缩包伪加密破解
```
➜ xxd test.zip dump

➜ md5 dump
MD5 (dump) = 5ca7cbfc9e727811bdcf2c290c78c8f6

➜ cat dump|head
00000000: 504b 0304 1400 0900 0800 58bd 2852 fec4  PK........X.(R..
00000010: 760a 2d44 0300 4661 0300 0d00 1c00 494d  v.-D..Fa......IM
00000020: 475f 3534 3439 2e6a 7065 6755 5409 0003  G_5449.jpegUT...
00000030: 787d f85f 0c8e 0b60 7578 0b00 0104 f501  x}._...`ux......
00000040: 0000 0414 0900 009c bd79 4052 e9df 37cc  .........y@R..7.
00000050: 4c4d 4d39 657b 538e 32ad 56a6 4e99 3299  LMM9e{S.2.V.N.2.
00000060: ca94 95a5 9965 2aee 4c8b 2b22 4dee 8a9c  .....e*.L.+"M...
00000070: 5fd3 62ea 9853 a68e 9a52 999a 2ba6 2229  _.b..S...R..+.")
00000080: 08e5 9229 2ab9 92a0 92fb 82c8 a62c 0287  ...)*........,..
00000090: f738 f77d 3fcf f3c7 f3c7 fbbe 47d1 231e  .8.}?.......G.#.

➜ sed -i 's/0900/0000/1' dump

➜ cat dump|head
00000000: 504b 0304 1400 0000 0800 58bd 2852 fec4  PK........X.(R..
00000010: 760a 2d44 0300 4661 0300 0d00 1c00 494d  v.-D..Fa......IM
00000020: 475f 3534 3439 2e6a 7065 6755 5409 0003  G_5449.jpegUT...
00000030: 787d f85f 0c8e 0b60 7578 0b00 0104 f501  x}._...`ux......
00000040: 0000 0414 0000 009c bd79 4052 e9df 37cc  .........y@R..7.
00000050: 4c4d 4d39 657b 538e 32ad 56a6 4e99 3299  LMM9e{S.2.V.N.2.
00000060: ca94 95a5 9965 2aee 4c8b 2b22 4dee 8a9c  .....e*.L.+"M...
00000070: 5fd3 62ea 9853 a68e 9a52 999a 2ba6 2229  _.b..S...R..+.")
00000080: 08e5 9229 2ab9 92a0 92fb 82c8 a62c 0287  ...)*........,..
00000090: f738 f77d 3fcf f3c7 f3c7 fbbe 47d1 231e  .8.}?.......G.#.

➜ xxd -r dump > test.zip

➜ unzip test.zip
Archive:  test.zip
  inflating: etc/hosts
```