#### URIencode
```
➜ printf 你好世界 | xxd -plain  | sed 's/.\{2\}/%&/g'
%e4%bd%a0%e5%a5%bd%e4%b8%96%e7%95%8c

➜ printf 你好世界 | od -An -tx1 | tr ' ' '%'
%e4%bd%a0%e5%a5%bd%e4%b8%96%e7%95%8c
```
#### URIdecode
```
➜ pbpaste
%e4%bd%a0%e5%a5%bd%e4%b8%96%e7%95%8c

➜ echo $(pbpaste|sed 's|%|\\x|g')
你好世界
```
#### od
```
➜ printf 你好世界 | od -An -to1
 344 275 240 345 245 275 344 270 226 347 225 214

➜ printf 你好世界 | od -An -to1 | sed 's| |\\0|g'
\0344\0275\0240\0345\0245\0275\0344\0270\0226\0347\0225\021
```
#### hexdump
```
➜ printf 你好世界 | hexdump -C
00000000  e4 bd a0 e5 a5 bd e4 b8  96 e7 95 8c              |............|
0000000c

➜ printf James | hexdump -C
00000000  4a 61 6d 65 73                                    |James|
00000005
```
#### xxd
```
➜ printf 你好世界|xxd
00000000: e4bd a0e5 a5bd e4b8 96e7 958c            ............

➜ printf 你好世界|xxd -u
00000000: E4BD A0E5 A5BD E4B8 96E7 958C            ............

➜ printf 你好世界|xxd -u -plain
E4BDA0E5A5BDE4B896E7958C

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

➜ printf "Hello World" > text

➜ xxd text dump

➜ cat dump
00000000: 4865 6c6c 6f20 576f 726c 64              Hello World

➜ sed -i 's/48/68/' dump

➜ xxd -r dump > text

➜ cat text
hello World

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

➜ printf 你好世界|xxd -b
00000000: 11100100 10111101 10100000 11100101 10100101 10111101  ......
00000006: 11100100 10111000 10010110 11100111 10010101 10001100  ......

➜ printf 你好世界|xxd -b|cut -d' ' -f2-7
11100100 10111101 10100000 11100101 10100101 10111101
11100100 10111000 10010110 11100111 10010101 10001100
```

[What is the difference between the od, hd, hexdump and xxd commands?](https://unix.stackexchange.com/questions/562347/what-is-the-difference-between-the-od-hd-hexdump-and-xxd-commands)  