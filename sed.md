## 注意事项   
macOS 上的 sed 并不是 GNU Project 亲生的，苹果对其稍微进行了修改，主要体现在需要添加备份参数和 \n 转义上。
如果不习惯使用 macOS 的 sed 可以使用 gsed 替代：  
```
brew install gcc prel hexyl gnu-sed coreutils binutils python3
```

## 添加字符  
#### 行首添加
```
➜ echo '文本'|gsed 's/^/开头/'
开头文本
```
#### 指定行添加  
```
➜ echo -e "第一行\n第二行\n第三行\n第四行\n第五行"|gsed '2,4s/^/  /'
第一行
  第二行
  第三行
  第四行
第五行
```
#### 行尾添加 多用于 GitHub README.md  
```
➜ echo -e "第一行\n第二行\n第三行\n第四行\n第五行"|gsed '2,4s/$/结尾/'
第一行
第二行结尾
第三行结尾
第四行结尾
第五行
```
#### 跨行添加
```
➜ echo '一二'|gsed  $'s/二/\\n&/'
一
二

➜ echo '一二'|gsed  's/二/\n&/'
一
二

➜ echo -e '第一行\n第二行\n第三行'|gsed '1i 测试行'
测试行
第一行
第二行
第三行

➜ echo -e '第一行\n第二行\n第三行'|gsed '2i 测试行'
第一行
测试行
第二行
第三行

➜ echo -e '第一行\n第二行\n第三行'|gsed '$i 测试行'
第一行
第二行
测试行
第三行

➜ echo -e '第一行\n第二行\n第三行'|gsed '$a 测试行'
第一行
第二行
第三行
测试行
```

#### 每行之后添加换行或者字符 建议使用 printf 实现
```
➜ cat test.txt
第一行
第二行
第三行

➜ cat test.txt|xargs printf "%s\n\n"
第一行

第二行

第三行

➜ brew list | xargs -n 1 printf "%s  平安，"
adns 平安，aircrack-ng 平安，fzf 平安...
```

#### 匹配后添加
```
➜ echo -e "标题一\n标题二\n标题三"|gsed 's/^标题/### &/'
### 标题一
### 标题二
### 标题三
```
#### 间隔添加
```
➜ echo ef2d9dad22f7342c62a9bed2a65dc8b5 | gsed 's/.\{2\}/\\x&/g'
\xef\x2d\x9d\xad\x22\xf7\x34\x2c\x62\xa9\xbe\xd2\xa6\x5d\xc8\xb5
```

## 删除字符  
#### 删除空行  
```
➜ echo -e "第一行\n第二行\n\n\n第四行\n第五行"|gsed '/^$/d'
第一行
第二行
第四行
第五行
```
#### 删除首行  
```
➜ echo -e "第一行\n第二行\n第三行\n第四行\n第五行"|gsed '1d'
第二行
第三行
第四行
第五行
```
#### 删除末行  
```
➜ echo -e "第一行\n第二行\n第三行\n第四行\n第五行"|gsed '$d'
第一行
第二行
第三行
第四行
```
#### 删除指定行，例如第3行  
```
➜ echo -e "第一行\n第二行\n第三行\n第四行\n第五行"|gsed '3d'
第一行
第二行
第四行
第五行
```
#### 删除第1到2行：  
```
➜ echo -e "第一行\n第二行\n第三行\n第四行\n第五行"|gsed '1,2d'
第三行
第四行
第五行
```

#### 删除重复空白行 建议使用 cat -s
```
➜ echo -e "第一行\n第二行\n\n\n\n\n\n第四行\n第五行"|cat -s
第一行
第二行

第四行
第五行

➜ cat test
1


2


3

➜ cat -s test|pbcopy&&pbpaste > test

➜ cat test
1

2

3
```

#### 封装删除多余空行函数
```
➜ echo "function unline(){cat -s \$1|pbcopy&&pbpaste > \$1}" >> ~/.zshrc

➜ source ~/.zshrc

➜ cat new.txt
1


2


3

➜ unline new.txt;cat new.txt
1

2

3
```

#### 删除开头或者末尾指定数量字符
```
➜ cat name.txt
- [] 01 侯亮平
- [] 02 李达康
- [] 03 高育良
- [] 04 祁同伟
- [] 05 沙瑞金
- [] 06 季昌明
- [] 07 易学习
- [] 08 陈岩石
- [] 09 赵东来
- [] 10 郑西坡

➜ cat name.txt|gsed 's/^.....//g'
01 侯亮平
02 李达康
03 高育良
04 祁同伟
05 沙瑞金
06 季昌明
07 易学习
08 陈岩石
09 赵东来
10 郑西坡

➜ cat name.txt|gsed 's/^.\{5\}//g'
01 侯亮平
02 李达康
03 高育良
04 祁同伟
05 沙瑞金
06 季昌明
07 易学习
08 陈岩石
09 赵东来
10 郑西坡

➜ cat name.txt|gsed 's/..$/某某/g'
- [] 01 侯某某
- [] 02 李某某
- [] 03 高某某
- [] 04 祁某某
- [] 05 沙某某
- [] 06 季某某
- [] 07 易某某
- [] 08 陈某某
- [] 09 赵某某
- [] 10 郑某某
```

#### 删除指定数量字符
```
➜ objdump -M intel -d if > if.s
➜ cat if.s
   100003f70:	55                   	push   rbp
   100003f71:	48 89 e5             	mov    rbp,rsp
   100003f74:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
   100003f7b:	89 7d f8             	mov    DWORD PTR [rbp-0x8],edi
   100003f7e:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
   100003f82:	c7 45 ec 01 00 00 00 	mov    DWORD PTR [rbp-0x14],0x1
   100003f89:	c7 45 e8 02 00 00 00 	mov    DWORD PTR [rbp-0x18],0x2
   100003f90:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
   100003f93:	3b 45 e8             	cmp    eax,DWORD PTR [rbp-0x18]
   100003f96:	0f 8e 0c 00 00 00    	jle    100003fa8 <_main+0x38>
   100003f9c:	c7 45 e4 03 00 00 00 	mov    DWORD PTR [rbp-0x1c],0x3
   100003fa3:	e9 07 00 00 00       	jmp    100003faf <_main+0x3f>
   100003fa8:	c7 45 e4 04 00 00 00 	mov    DWORD PTR [rbp-0x1c],0x4
   100003faf:	31 c0                	xor    eax,eax
   100003fb1:	5d                   	pop    rbp
   100003fb2:	c3                   	ret

➜ cat if.s|gsed 's/^.\{36\}//'
push   rbp
mov    rbp,rsp
mov    DWORD PTR [rbp-0x4],0x0
mov    DWORD PTR [rbp-0x8],edi
mov    QWORD PTR [rbp-0x10],rsi
mov    DWORD PTR [rbp-0x14],0x1
mov    DWORD PTR [rbp-0x18],0x2
mov    eax,DWORD PTR [rbp-0x14]
cmp    eax,DWORD PTR [rbp-0x18]
jle    100003fa8 <_main+0x38>
mov    DWORD PTR [rbp-0x1c],0x3
jmp    100003faf <_main+0x3f>
mov    DWORD PTR [rbp-0x1c],0x4
xor    eax,eax
pop    rbp
ret

➜ cat if.s|gsed -e 's/^.\{3\}// ; s/:.\{23\}/: /g'
100003f70: push   rbp
100003f71: mov    rbp,rsp
100003f74: mov    DWORD PTR [rbp-0x4],0x0
100003f7b: mov    DWORD PTR [rbp-0x8],edi
100003f7e: mov    QWORD PTR [rbp-0x10],rsi
100003f82: mov    DWORD PTR [rbp-0x14],0x1
100003f89: mov    DWORD PTR [rbp-0x18],0x2
100003f90: mov    eax,DWORD PTR [rbp-0x14]
100003f93: cmp    eax,DWORD PTR [rbp-0x18]
100003f96: jle    100003fa8 <_main+0x38>
100003f9c: mov    DWORD PTR [rbp-0x1c],0x3
100003fa3: jmp    100003faf <_main+0x3f>
100003fa8: mov    DWORD PTR [rbp-0x1c],0x4
100003faf: xor    eax,eax
100003fb1: pop    rbp
100003fb2: ret
```
#### 显示某行
```
➜ echo -e "第一行\n第二行\n第三行\n第四行\n第五行"|gsed -n '4,5p'
第四行
第五行 

➜ echo -e "第一行\n第二行\n第三行\n第四行\n第五行"|gsed -n '2,5p'
第二行
第三行
第四行
第五行 
```
#### 反向输出字符
```
➜ md5 -qs 'JamesHopbourn'
271929258c8693b89c6f7d4e8234f98f

➜ md5 -qs 'JamesHopbourn'|rev
f89f4328e4d7f6c98b3968c852929172
```
#### 显示特定位置字符
```
➜ md5 -qs 'JamesHopbourn'|gcut -b 1-6
271929
```
#### 串联命令删除字符 要求保留字符串
```
➜ md5 -s 'JamesHopbourn'
MD5 ("JamesHopbourn") = 271929258c8693b89c6f7d4e8234f98f

➜ md5 -s 'JamesHopbourn'|gsed 's/MD5 ("// ; s/")// ; s/ //g'
JamesHopbourn=271929258c8693b89c6f7d4e8234f98f

md5 -s 'JamesHopbourn'|gsed 's/MD5 ("// ; s/")// ; s/ //g ; s/.\{26\}$//'
JamesHopbourn=271929
```
#### 两种方法乱序显示文本的行
```
➜ head test.dat
MD5 ("1000000") = 8155bc545f84d9652f1012ef2bdfb6eb
MD5 ("1000001") = 59e711d152de7bec7304a8c2ecaf9f0f
MD5 ("1000002") = 877466ffd21fe26dd1b3366330b7b560
MD5 ("1000003") = f31c147335274c56d801f833d3c26a70
MD5 ("1000004") = f68ec4f0c6df90137749af75a929a3eb
MD5 ("1000005") = 0f190e6e164eafe66f011073b4486975
MD5 ("1000006") = a9588aa82388c0579d8f74b4d02b895f
MD5 ("1000007") = 66a516f865fca1c921dba625ede4a693
MD5 ("1000008") = 7cebd0178b69b2e88774529e1e59a7b0
MD5 ("1000009") = ad1df793247a0e650d0d7166341b8d97

➜ head test.dat|gshuf
MD5 ("1000005") = 0f190e6e164eafe66f011073b4486975
MD5 ("1000001") = 59e711d152de7bec7304a8c2ecaf9f0f
MD5 ("1000000") = 8155bc545f84d9652f1012ef2bdfb6eb
MD5 ("1000002") = 877466ffd21fe26dd1b3366330b7b560
MD5 ("1000008") = 7cebd0178b69b2e88774529e1e59a7b0
MD5 ("1000006") = a9588aa82388c0579d8f74b4d02b895f
MD5 ("1000007") = 66a516f865fca1c921dba625ede4a693
MD5 ("1000004") = f68ec4f0c6df90137749af75a929a3eb
MD5 ("1000003") = f31c147335274c56d801f833d3c26a70
MD5 ("1000009") = ad1df793247a0e650d0d7166341b8d97

➜ head test.dat|sort -R
MD5 ("1000005") = 0f190e6e164eafe66f011073b4486975
MD5 ("1000009") = ad1df793247a0e650d0d7166341b8d97
MD5 ("1000006") = a9588aa82388c0579d8f74b4d02b895f
MD5 ("1000004") = f68ec4f0c6df90137749af75a929a3eb
MD5 ("1000008") = 7cebd0178b69b2e88774529e1e59a7b0
MD5 ("1000007") = 66a516f865fca1c921dba625ede4a693
MD5 ("1000002") = 877466ffd21fe26dd1b3366330b7b560
MD5 ("1000000") = 8155bc545f84d9652f1012ef2bdfb6eb
MD5 ("1000003") = f31c147335274c56d801f833d3c26a70
MD5 ("1000001") = 59e711d152de7bec7304a8c2ecaf9f0f
```

## 替换字符  
#### 全局替换  
```
➜ echo -e "第一行\n第二行\n第三行\n第四行\n第五行"|gsed 's/行/列/'
第一列
第二列
第三列
第四列
第五列
```
#### [替换单引号](https://blog.csdn.net/wangbole/article/details/8250271)  
```
➜ echo "Hi,I'm James"|gsed 's/'"'"/'"''/'  
Hi,I"m James
```
#### 替换单行  
```
➜ echo -e "第一行\n第二行\n第三行\n第四行\n第五行"|gsed '1c 替换文本'
替换文本
第二行
第三行
第四行
第五行
```
#### 替换多行  
```
➜ echo -e "第一行\n第二行\n 第三行\n第四行\n第五行"|gsed '1,4c 替换文本'
替换文本
第五行 
```
#### 空格替换为 \x
```
➜ hexyl test.txt
┌────────┬─────────────────────────┬─────────────────────────┬────────┬────────┐
│00000000│ e6 b5 8b e8 af 95 e6 96 ┊ 87 e6 9c ac 0a          │××××××××┊××××_   │
└────────┴─────────────────────────┴─────────────────────────┴────────┴────────┘

➜ echo 'e6 b5 8b e8 af 95'|sed 's/ /\\x/g ; s/^/\\x/g'
\xe6\xb5\x8b\xe8\xaf\x95

➜ echo '\xe6\xb5\x8b\xe8\xaf\x95'
测试
```
#### 替换二进制字符串
```
➜ gcc main.c -o main;./main
您

➜ python3 -c 'print("您".encode("utf-8"))'
b'\xe6\x82\xa8'

➜ python3 -c 'print("我".encode("utf-8"))'
b'\xe6\x88\x91'

➜ sed -i 's/\xe6\x82\xa8/\xe6\x88\x91/' main

➜ ./main
我
```
#### 特殊字符转义
```
➜ cat name.txt|gsed "s/\[.*\]/[X]/g"
- [X] 01 侯亮平
- [X] 02 李达康
- [X] 03 高育良
- [X] 04 祁同伟
- [X] 05 沙瑞金
- [X] 06 季昌明
- [X] 07 易学习
- [X] 08 陈岩石
- [X] 09 赵东来
- [X] 10 郑西坡
```
#### 替换正则第 1 次匹配结果 
```
➜ echo '1111 2222'|gsed -E '1s/[0-9]{4}/0100/'
0100 2222
```
#### 替换正则第 4 次匹配结果
```
➜ echo '1111 2222 3333 4444'|gsed -E '1s/[0-9]{4}/0100/4'
1111 2222 3333 0100
```
#### 非贪婪匹配建议使用 perl
```
➜ echo 'ssh://personal/JamesHopbourn/dotfile'|perl -pe 's/ssh:\/\/.*?\//https:\/\/github.com\//'
https://github.com/JamesHopbourn/dotfile
```

## 其他用法
#### 串联命令
```
➜ gsed 's/ /0/g ; s/#/1/g' test.txt
➜ gsed -e 's/ /0/g' -e 's/#/1/g' test.txt
```
#### 合并为单行建议使用 tr
```
➜ tr "\n" " " <<< $(echo -e "Make\nsed\ngreat\nagain") 
Make sed great again
```

## sed 参考资料  
[SED 简明教程](https://coolshell.cn/articles/9104.html)  
[三十分钟学会SED](https://github.com/mylxsw/growing-up/blob/master/doc/三十分钟学会SED.md)  
[sed 命令详解 & 正则表达式](https://blog.csdn.net/gua___gua/article/details/49304699)    
  
