## 目录
- [命令安装](#命令安装)
- [版本信息](#版本信息)
- [添加字符](#添加字符)
    - [行首添加](#行首添加)
    - [指定行添加](#指定行添加)
    - [行尾添加](#行尾添加)
    - [跨行添加](#跨行添加)
    - [每行之后添加换行符](#每行之后添加换行)
    - [匹配后添加](#匹配后添加)
    - [间隔添加](#间隔添加)
    - [编码相关](#编码相关)
    - [排除后再添加](#排除后再添加)
    - [中英文间添加空格](#中英文间添加空格)
- [删除字符](#删除字符)
    - [删除空行](#删除空行)
    - [删除首行](#删除首行)
    - [删除末行](#删除末行)
    - [删除固定的倒数N行](#删除固定的倒数N行)
    - [删除指定行，例如第3行](#删除指定行，例如第3行)
    - [删除第1到2行](#删除第1到2行)
    - [删除除了1、2行](#删除除了1、2行)
    - [删除第2到最后行](#删除第2到最后行)
    - [删除除了一三字符行](#删除除了一三字符行)
    - [二三四行删除末字](#二三四行删除末字)
    - [特定字符删到最后](#特定字符删到最后)
    - [删除重复空白行 建议使用 cat -s](#删除重复空白行-建议使用-cat--s)
    - [封装删除多余空行函数](#封装删除多余空行函数)
    - [删除开头或者末尾指定数量字符](#删除开头或者末尾指定数量字符)
    - [删除指定数量字符](#删除指定数量字符)
    - [删除所有字符保留开头 N 个字符](删除所有字符保留开头-N-个字符)
    - [删除所有字符保留结尾 N 个字符](删除所有字符保留结尾-N-个字符)
    - [右斜杠符号删除](#右斜杠符号删除)
    - [每两行合并为一行](#每两行合并为一行)
- [显示字符](#显示字符)
    - [显示指定行](#显示指定行)
    - [匹配后输出](#匹配后输出)
    - [过滤后输出匹配行](#过滤后输出匹配行)
    - [过滤后统计匹配行](#过滤后统计匹配行)
    - [反向输出字符](#反向输出字符)
    - [显示特定位置字符](#显示特定位置字符)
    - [串联命令删除字符 要求保留字符串](#串联命令删除字符-要求保留字符串)
    - [两种方法乱序输出文本的行](#两种方法乱序输出文本的行)
- [替换字符](#替换字符)
    - [全局替换](#全局替换)
    - [奇数行替换](#奇数行替换)
    - [偶数行替换](#偶数行替换)
    - [每个第三行](#每三行替换)
    - [首行起每三行](#首行起每三行替换)
    - [正向仅仅匹配一次](#正向仅仅匹配一次)
    - [逆向仅仅匹配一次](#逆向仅仅匹配一次)
    - [按组匹配然后替换](#按组匹配然后替换)
    - [最后一个替换](#最后一个替换)
    - [指定位置替换](#指定位置替换)
    - [匹配字符后再替换](#匹配字符后再替换)
    - [大写转小写](#大写转小写)
    - [小写转大写](#小写转大写)
    - [大小写互换](#大小写互换)
    - [替换单引号](#替换单引号)
    - [多个字符匹配](#多个字符匹配)
    - [替换单行](#替换单行)
    - [替换多行](#替换多行)
    - [空格替换为十六进制标志](#空格替换为十六进制标志)
    - [替换二进制字符串](#替换二进制字符串)
    - [二进制补零对齐](#二进制补零对齐)
    - [括号斜杠字符转义](#特殊字符转义)
    - [Tab 缩进删除](#Tab-缩进删除)
    - [替换正则第 1 次匹配结果](#替换正则第-1-次匹配结果)
    - [替换正则第 4 次匹配结果](#替换正则第-4-次匹配结果)
    - [非贪婪匹配建议使用 perl](#非贪婪匹配建议使用-perl)
    - [非贪婪匹配处理 post 请求](#非贪婪匹配处理-post-请求)
- [其他用法](#其他用法)
    - [递归修改全部匹配文件](#递归修改全部匹配文件)
    - [合并为单行建议使用 tr](#合并为单行建议使用-tr)
    - [生成本文目录](#综合测验-生成本文目录)
    - [生成 TOC 命令注释](#生成-TOC-命令注释)
    - [代码开头空格转圆点](#代码开头空格转圆点)
- [生活实际需求](#生活实际需求)
    - [图片引用转为 Obsidian 格式](#图片引用转为-Obsidian-格式)
    - [Anki 填词挖空](#Anki-填词挖空)
    - [LF to CRLF](#LF-to-CRLF)
    - [CRLF to LF](#CRLF-to-LF)
    - [cURL decode](#cURL-decode)
    - [日期格式化](#日期格式化)
- [调试工具](#调试工具)
- [gsed 参考资料](#gsed-参考资料)

## 命令安装
```
brew install gcc prel hexyl binutils python3
brew install gnu-indent gnu-sed gnutls grep gnu-tar gawk coreutils
```
## 版本信息
```
➜ gsed --version
gsed (GNU sed) 4.8
Copyright (C) 2020 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <https://gnu.org/licenses/gpl.html>.
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.

Written by Jay Fenlason, Tom Lord, Ken Pizzini,
Paolo Bonzini, Jim Meyering, and Assaf Gordon.

This sed program was built without SELinux support.

GNU sed home page: <https://www.gnu.org/software/sed/>.
General help using GNU software: <https://www.gnu.org/gethelp/>.
E-mail bug reports to: <bug-sed@gnu.org>.
```
## 添加字符  
#### 行首添加
```
➜ echo '文本'|gsed 's/^/开头/'
开头文本
```
#### 指定行添加  
```
➜ echo "第一行\n第二行\n第三行\n第四行\n第五行"|gsed '2,4s/^/  /'
第一行
  第二行
  第三行
  第四行
第五行
```
#### 行尾添加 
```
➜ echo "第一行\n第二行\n第三行\n第四行\n第五行"|gsed '2,4s/$/结尾/'
第一行
第二行结尾
第三行结尾
第四行结尾
第五行
```
#### 跨行添加
```
➜ echo '一二'|gsed  's/二/\n&/'
一
二

➜ echo '第一行\n第二行\n第三行'|gsed '1i 测试行'
测试行
第一行
第二行
第三行

➜ echo '第一行\n第二行\n第三行'|gsed '2i 测试行'
第一行
测试行
第二行
第三行

➜ echo '第一行\n第二行\n第三行'|gsed '$i 测试行'
第一行
第二行
测试行
第三行

➜ echo '第一行\n第二行\n第三行'|gsed '$a 测试行'
第一行
第二行
第三行
测试行
```

#### 每行之后添加换行
```
➜ cat test.txt
第一行
第二行
第三行

➜ cat test.txt|gsed G
第一行

第二行

第三行
```

#### 匹配后添加
```
➜ echo "标题一\n标题二\n标题三"|gsed 's/^标题/### &/'
### 标题一
### 标题二
### 标题三
```
#### 间隔添加
```
➜ echo ef2d9dad22f7342c62a9bed2a65dc8b5|gsed 's/.\{2\}/\\x&/g'
\xef\x2d\x9d\xad\x22\xf7\x34\x2c\x62\xa9\xbe\xd2\xa6\x5d\xc8\xb5

➜ echo 00000000000000000000000000000010|gsed 's/.\{4\}/& /g'
0000 0000 0000 0000 0000 0000 0000 0010

➜ echo 00000000000000000000000000000010|gsed 's/.\{4\}/& /g ; s/./X/ ; s/0/2/g ; s/1/0/g ; s/2/1/g'
X111 1111 1111 1111 1111 1111 1111 1101
```
#### 编码相关
```
➜ echo \xef\x2d\x9d\xad\x22\xf7\x34\x2c\x62\xa9\xbe\xd2\xa6\x5d\xc8\xb5|gsed -e 's/\x//g'
ef2d9dad22f7342c62a9bed2a65dc8b5

➜ echo ef2d9dad22f7342c62a9bed2a65dc8b5|gsed 's/.\{2\}/\\x&/g'
\xef\x2d\x9d\xad\x22\xf7\x34\x2c\x62\xa9\xbe\xd2\xa6\x5d\xc8\xb5
```
#### 排除后再添加
```
➜ cat book.md
### 家庭的幸福需要经营
正面管教
亲密关系
如何培养孩子的社会能力
如何让你爱的人爱上你
原生家庭
热锅上的家庭

### 内心的强大需要磨练
终身成长
自卑与超越
应对焦虑
幸福的方法
感受爱
坚毅

### 健康生活从读书开始
学会吃饭
这书能让你就按
高效休息法
运动改变大脑
谷物大脑
跑步圣经

➜ gsed '/^#/b ; /^$/b ; /^《/b ; s/^/《/g ; s/$/》/g' book.md
/^#/b：排除以 # 开头的 Markdown 标题记号
/^$/b：排除空白行
/^《/b：排除已经带有书名号的行
s/^/《/g：剩余行开头添加左书名号
s/$/》/g：剩余行结尾添加右书名号

### 家庭的幸福需要经营
《正面管教》
《亲密关系》
《如何培养孩子的社会能力》
《如何让你爱的人爱上你》
《原生家庭》
《热锅上的家庭》

### 内心的强大需要磨练
《终身成长》
《自卑与超越》
《应对焦虑》
《幸福的方法》
《感受爱》
《坚毅》

### 健康生活从读书开始
《学会吃饭》
《这书能让你就按》
《高效休息法》
《运动改变大脑》
《谷物大脑》
《跑步圣经》
```
#### 中英文间添加空格
```
➜ echo '这是test文本，sed真的很强大'|gsed  's/\([[:upper:][:lower:][:digit:]]\+\)\([^[:upper:][:lower:][:space:][:punct:][:digit:]]\)/\1 \2/g'|gsed 's/\([^[:upper:][:lower:][:space:][:punct:][:digit:]]\)\([[:upper:][:lower:][:digit:]]\+\)/\1 \2/g'
这是 test 文本，sed 真的很强大
```

## 删除字符  
#### 删除空行  
```
➜ echo "第一行\n第二行\n\n\n第四行\n第五行"|gsed '/^$/d'
第一行
第二行
第四行
第五行
```
#### 删除首行  
```
➜ echo "第一行\n第二行\n第三行\n第四行\n第五行"|gsed '1d'
第二行
第三行
第四行
第五行
```
#### 删除末行  
```
➜ echo "第一行\n第二行\n第三行\n第四行\n第五行"|gsed '$d'
第一行
第二行
第三行
第四行

➜ echo 八进制|od -tx1 -w3 -An|sed '$d'|sed "s|^|'| ; s|$|'| ; s| |\\\\x|g"
'\xe5\x85\xab'
'\xe8\xbf\x9b'
'\xe5\x88\xb6'
```
#### 删除固定的倒数N行
```
➜ echo 八进制|od -tx1 -w3|tac|sed '1,2d'|tac
0000000 e5 85 ab
0000003 e8 bf 9b
0000006 e5 88 b6
```
#### 删除指定行，例如第3行  
```
➜ echo "第一行\n第二行\n第三行\n第四行\n第五行"|gsed '3d'
第一行
第二行
第四行
第五行
```
#### 删除第1到2行  
```
➜ echo "第一行\n第二行\n第三行\n第四行\n第五行"|gsed '1,2d'
第三行
第四行
第五行
```
#### 删除除了1、2行  
```
➜ echo "第一行\n第二行\n第三行\n第四行\n第五行"|sed '1,2!d'
第一行
第二行
```
#### 删除第2到最后行  
```
➜ echo "第一行\n第二行\n第三行\n第四行\n第五行"|gsed '2,$d'
第一行
```
#### 删除除了一三字符行
```
➜ echo "第一行\n第二行\n第三行\n第四行\n第五行"|sed '/一\|三/!d'
第一行
第三行
```
#### 二三四行删除末字
```
➜ echo "第一行\n第二行\n第三行\n 第四行\n第五行"|sed '2,4{s/.$//}'
第一行
第二
第三
第四
第五行
```
#### 特定字符删到最后
```
➜ echo "第一行\n第二行\n第三行\n广告\n第四行\n第五行"|sed '/广告/,$d'
第一行
第二行
第三行
```
#### 删除重复空白行 建议使用 cat -s
```
➜ echo "第一行\n第二行\n\n\n\n\n\n第四行\n第五行"|cat -s
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
➜ echo "function unline(){cat -s \$1|pbcopy&&pbpaste > \$1;cat $1}" >> ~/.zshrc

➜ source ~/.zshrc

➜ cat new.txt
1


2


3

➜ unline new.txt
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

➜ cat name.txt|gsed 's/^.....//'
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

➜ cat name.txt|gsed 's/^.\{5\}//'
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

➜ cat name.txt|gsed 's/..$/某某/'
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

➜ cat name.txt|gsed 's/.\{2\}$/某某/'
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
➜ objdump -d -j .text -M intel sum

sum:     file format mach-o-x86-64


Disassembly of section .text:

0000000100003f30 <_main>:
   100003f30: 55                    push   rbp
   100003f31: 48 89 e5              mov    rbp,rsp
   100003f34: 48 83 ec 30           sub    rsp,0x30
   100003f38: c7 45 fc 00 00 00 00  mov    DWORD PTR [rbp-0x4],0x0
   100003f3f: 89 7d f8              mov    DWORD PTR [rbp-0x8],edi
   100003f42: 48 89 75 f0           mov    QWORD PTR [rbp-0x10],rsi
   100003f46: c7 45 ec 01 00 00 00  mov    DWORD PTR [rbp-0x14],0x1
   100003f4d: c7 45 e8 02 00 00 00  mov    DWORD PTR [rbp-0x18],0x2
   100003f54: c6 45 e3 41           mov    BYTE PTR [rbp-0x1d],0x41
   100003f58: 8b 45 ec              mov    eax,DWORD PTR [rbp-0x14]
   100003f5b: 03 45 e8              add    eax,DWORD PTR [rbp-0x18]
   100003f5e: 89 45 e4              mov    DWORD PTR [rbp-0x1c],eax
   100003f61: 8b 75 e4              mov    esi,DWORD PTR [rbp-0x1c]
   100003f64: 48 8d 3d 37 00 00 00  lea    rdi,[rip+0x37]        # 100003fa2 <_main+0x72>
   100003f6b: b0 00                 mov    al,0x0
   100003f6d: e8 0e 00 00 00        call   100003f80 <_main+0x50>
   100003f72: 31 c9                 xor    ecx,ecx
   100003f74: 89 45 dc              mov    DWORD PTR [rbp-0x24],eax
   100003f77: 89 c8                 mov    eax,ecx
   100003f79: 48 83 c4 30           add    rsp,0x30
   100003f7d: 5d                    pop    rbp
   100003f7e: c3                    ret

➜ objdump -d -j .text -M intel sum|gsed '1,6d ; s/^.\{36\}//'
0000000100003f30 <_main>:
push   rbp
mov    rbp,rsp
sub    rsp,0x30
mov    DWORD PTR [rbp-0x4],0x0
mov    DWORD PTR [rbp-0x8],edi
mov    QWORD PTR [rbp-0x10],rsi
mov    DWORD PTR [rbp-0x14],0x1
mov    DWORD PTR [rbp-0x18],0x2
mov    BYTE PTR [rbp-0x1d],0x41
mov    eax,DWORD PTR [rbp-0x14]
add    eax,DWORD PTR [rbp-0x18]
mov    DWORD PTR [rbp-0x1c],eax
mov    esi,DWORD PTR [rbp-0x1c]
lea    rdi,[rip+0x37]        # 100003fa2 <_main+0x72>
mov    al,0x0
call   100003f80 <_main+0x50>
xor    ecx,ecx
mov    DWORD PTR [rbp-0x24],eax
mov    eax,ecx
add    rsp,0x30
pop    rbp
ret

➜ objdump -d -j .text -M intel i++|gsed '1,7d ; s/^.\{36\}//'|awk '{printf("%02d %s\n", NR, $0)}'
01 push   rbp
02 mov    rbp,rsp
03 xor    eax,eax
04 mov    DWORD PTR [rbp-0x4],0x5
05 mov    DWORD PTR [rbp-0x8],0x0
06 mov    ecx,DWORD PTR [rbp-0x4]
07 add    ecx,0x1
08 mov    DWORD PTR [rbp-0x4],ecx
09 mov    DWORD PTR [rbp-0x8],ecx
10 mov    ecx,DWORD PTR [rbp-0x4]
11 mov    edx,ecx
12 add    edx,0x1
13 mov    DWORD PTR [rbp-0x4],edx
14 mov    DWORD PTR [rbp-0x8],ecx
15 pop    rbp
16 ret

➜ objdump -d -j .text -M intel sum|gsed '1,6d ; s/^.\{3\}// ; s/:.\{23\}/ /'
0000100003f30 <_main>:
100003f30 push   rbp
100003f31 mov    rbp,rsp
100003f34 sub    rsp,0x30
100003f38 mov    DWORD PTR [rbp-0x4],0x0
100003f3f mov    DWORD PTR [rbp-0x8],edi
100003f42 mov    QWORD PTR [rbp-0x10],rsi
100003f46 mov    DWORD PTR [rbp-0x14],0x1
100003f4d mov    DWORD PTR [rbp-0x18],0x2
100003f54 mov    BYTE PTR [rbp-0x1d],0x41
100003f58 mov    eax,DWORD PTR [rbp-0x14]
100003f5b add    eax,DWORD PTR [rbp-0x18]
100003f5e mov    DWORD PTR [rbp-0x1c],eax
100003f61 mov    esi,DWORD PTR [rbp-0x1c]
100003f64 lea    rdi,[rip+0x37]        # 100003fa2 <_main+0x72>
100003f6b mov    al,0x0
100003f6d call   100003f80 <_main+0x50>
100003f72 xor    ecx,ecx
100003f74 mov    DWORD PTR [rbp-0x24],eax
100003f77 mov    eax,ecx
100003f79 add    rsp,0x30
100003f7d pop    rbp
100003f7e ret

➜ objdump -d -j .text -M intel sum|gsed '1,6d ; s/^.\{3\}// ; s/:.\{23\}/ / ; /^.\{14\}/ s/  //'
0000100003f30 <_main>:
100003f30 push rbp
100003f31 mov  rbp,rsp
100003f34 sub  rsp,0x30
100003f38 mov  DWORD PTR [rbp-0x4],0x0
100003f3f mov  DWORD PTR [rbp-0x8],edi
100003f42 mov  QWORD PTR [rbp-0x10],rsi
100003f46 mov  DWORD PTR [rbp-0x14],0x1
100003f4d mov  DWORD PTR [rbp-0x18],0x2
100003f54 mov  BYTE PTR [rbp-0x1d],0x41
100003f58 mov  eax,DWORD PTR [rbp-0x14]
100003f5b add  eax,DWORD PTR [rbp-0x18]
100003f5e mov  DWORD PTR [rbp-0x1c],eax
100003f61 mov  esi,DWORD PTR [rbp-0x1c]
100003f64 lea  rdi,[rip+0x37]        # 100003fa2 <_main+0x72>
100003f6b mov  al,0x0
100003f6d call 100003f80 <_main+0x50>
100003f72 xor  ecx,ecx
100003f74 mov  DWORD PTR [rbp-0x24],eax
100003f77 mov  eax,ecx
100003f79 add  rsp,0x30
100003f7d pop  rbp
100003f7e ret

➜ objdump -d -j .text -M intel fun|gsed '1,6d ; s/^.\{3\}// ; s/:.\{23\}/ / ; /^.\{14\}/ s/  //'
0000100003ee0 <_func1>:
100003ee0 push rbp
100003ee1 mov  rbp,rsp
100003ee4 sub  rsp,0x10
100003ee8 mov  DWORD PTR [rbp-0x4],0x62
100003eef mov  DWORD PTR [rbp-0x8],0x3cc
100003ef6 mov  eax,DWORD PTR [rbp-0x4]
100003ef9 add  eax,DWORD PTR [rbp-0x8]
100003efc mov  DWORD PTR [rbp-0xc],eax
100003eff mov  esi,DWORD PTR [rbp-0x4]
100003f02 mov  edx,DWORD PTR [rbp-0x8]
100003f05 mov  ecx,DWORD PTR [rbp-0xc]
100003f08 lea  rdi,[rip+0x83]        # 100003f92 <_main+0x42>
100003f0f mov  al,0x0
100003f11 call 100003f72 <_main+0x22>
100003f16 add  rsp,0x10
100003f1a pop  rbp
100003f1b ret
100003f1c nop  DWORD PTR [rax+0x0]

0000100003f20 <_func2>:
100003f20 push rbp
100003f21 mov  rbp,rsp
100003f24 sub  rsp,0x10
100003f28 mov  esi,DWORD PTR [rbp-0x4]
100003f2b mov  edx,DWORD PTR [rbp-0x8]
100003f2e mov  ecx,DWORD PTR [rbp-0xc]
100003f31 lea  rdi,[rip+0x5a]        # 100003f92 <_main+0x42>
100003f38 mov  al,0x0
100003f3a call 100003f72 <_main+0x22>
100003f3f add  rsp,0x10
100003f43 pop  rbp
100003f44 ret
100003f45 nop  WORD PTR cs:[rax+rax*1+0x0]
100003f4c:  00 00 00
100003f4f nop

0000100003f50 <_main>:
100003f50 push rbp
100003f51 mov  rbp,rsp
100003f54 sub  rsp,0x10
100003f58 mov  DWORD PTR [rbp-0x4],0x0
100003f5f call 100003ee0 <_func1>
100003f64 call 100003f20 <_func2>
100003f69 xor  eax,eax
100003f6b add  rsp,0x10
100003f6f pop  rbp
100003f70 ret
```
#### 删除所有字符保留开头 N 个字符
```
➜ echo 1234567890|gsed -r 's/(.{4}).*/\1/'
1234

➜ ch2py 赵德汉|xargs -n 1 printf "%s\n"|sed -r 's/(.{1}).*/\1/'|xargs|sed 's/ //g'
zdh

➜ pbpaste
侯亮平
李达康
高育良
祁同伟
沙瑞金
季昌明
易学习
陈岩石
赵东来
郑西坡

➜ pbpaste|tr '\n' '1'
侯亮平1李达康1高育良1祁同伟1沙瑞金1季昌明1易学习1陈岩石1赵东来1郑西坡

➜ ch2py $(pbpaste|tr '\n' '1')|xargs -n 1 printf "%s\n"|sed -r 's/(.{1}).*/\1/'|xargs |sed 's/ //g'|tr '1' '\n'
hlp
ldk
gyl
qtw
srj
jcm
yxx
cys
zdl
zxp
```
#### 删除所有字符保留结尾 N 个字符
```
➜ echo 1234567890|gsed -r 's/.*(.{4})/\1/'
7890
```
#### 右斜杠符号删除
```
➜ python3 -c 'print("马".encode("unicode_escape").lower())'
b'\\u9a6c'

➜ python3 -c 'print("马".encode("unicode_escape").lower())'|gsed "s|b'\\\\|| ; s|.$||"
\u9a6c

➜ python3 -c 'print("马".encode("unicode_escape").lower())'|gsed "s|b'\\\\|| ; s|.$||"|pbcopy
```
#### 每两行合并为一行
```
➜ cat test.md
36.8|36.6|36.1|37.0|36.2|36.1|37.0|36.5|36.8|36.5|36.6|36.6|36.4|36.1|36.1|36.2|37.1|36.4|36.7|37.1|36.8|36.2|36.6|36.7|36.0|36.3|36.9|36.6|36.2|36.6
37.0|37.1|36.9|36.9|36.1|36.0|36.3|37.0|36.0|37.1|36.3|36.8|36.8|36.6|37.1|36.3|36.5|36.4|37.0|36.3|36.4|36.9|36.3|36.4|36.2|36.0|36.0|37.0|36.0|36.3
36.1|36.1|36.3|36.5|36.5|36.2|36.7|37.0|36.1|37.0|36.8|36.5|36.4|36.7|36.5|36.4|36.0|37.1|37.1|36.2|36.9|36.2|37.1|37.1|36.1|36.7|36.4|36.8|36.3|36.8
36.9|36.9|36.0|36.6|36.9|36.6|36.8|36.7|36.5|36.7|37.1|36.7|36.7|36.4|37.0|36.1|36.6|36.4|36.5|36.0|36.0|36.8|36.9|36.2|37.0|36.5|36.2|36.7|36.3|36.9
37.1|36.2|36.0|36.6|36.4|36.0|36.8|36.2|37.0|37.0|37.1|36.9|36.0|36.6|36.8|36.9|36.8|37.1|37.0|36.0|36.2|36.5|36.1|37.0|36.8|36.3|36.7|36.1|36.8|36.6
37.1|36.2|36.4|36.0|36.1|36.4|36.8|36.1|36.0|36.9|36.2|36.1|36.6|36.8|36.4|36.4|37.0|36.7|37.0|36.7|36.9|36.5|36.0|36.8|36.9|36.2|36.2|36.4|36.5|36.3
37.1|36.2|37.1|37.1|36.4|36.9|36.3|36.5|36.6|36.3|36.8|36.3|37.0|36.7|36.9|36.1|36.3|36.3|36.7|36.1|36.2|36.9|36.6|36.5|36.6|37.1|36.1|36.3|36.6|37.0
37.0|36.5|36.9|36.2|36.1|36.7|37.1|36.7|36.4|36.5|36.5|36.4|37.0|36.9|37.1|36.7|36.0|36.3|36.7|36.7|36.5|36.3|36.0|36.6|36.0|36.6|36.8|36.5|36.4|36.1

➜ gsed 'N;s/\n/ /' test.md
36.8|36.6|36.1|37.0|36.2|36.1|37.0|36.5|36.8|36.5|36.6|36.6|36.4|36.1|36.1|36.2|37.1|36.4|36.7|37.1|36.8|36.2|36.6|36.7|36.0|36.3|36.9|36.6|36.2|36.6 37.0|37.1|36.9|36.9|36.1|36.0|36.3|37.0|36.0|37.1|36.3|36.8|36.8|36.6|37.1|36.3|36.5|36.4|37.0|36.3|36.4|36.9|36.3|36.4|36.2|36.0|36.0|37.0|36.0|36.3
36.1|36.1|36.3|36.5|36.5|36.2|36.7|37.0|36.1|37.0|36.8|36.5|36.4|36.7|36.5|36.4|36.0|37.1|37.1|36.2|36.9|36.2|37.1|37.1|36.1|36.7|36.4|36.8|36.3|36.8 36.9|36.9|36.0|36.6|36.9|36.6|36.8|36.7|36.5|36.7|37.1|36.7|36.7|36.4|37.0|36.1|36.6|36.4|36.5|36.0|36.0|36.8|36.9|36.2|37.0|36.5|36.2|36.7|36.3|36.9
37.1|36.2|36.0|36.6|36.4|36.0|36.8|36.2|37.0|37.0|37.1|36.9|36.0|36.6|36.8|36.9|36.8|37.1|37.0|36.0|36.2|36.5|36.1|37.0|36.8|36.3|36.7|36.1|36.8|36.6 37.1|36.2|36.4|36.0|36.1|36.4|36.8|36.1|36.0|36.9|36.2|36.1|36.6|36.8|36.4|36.4|37.0|36.7|37.0|36.7|36.9|36.5|36.0|36.8|36.9|36.2|36.2|36.4|36.5|36.3
37.1|36.2|37.1|37.1|36.4|36.9|36.3|36.5|36.6|36.3|36.8|36.3|37.0|36.7|36.9|36.1|36.3|36.3|36.7|36.1|36.2|36.9|36.6|36.5|36.6|37.1|36.1|36.3|36.6|37.0 37.0|36.5|36.9|36.2|36.1|36.7|37.1|36.7|36.4|36.5|36.5|36.4|37.0|36.9|37.1|36.7|36.0|36.3|36.7|36.7|36.5|36.3|36.0|36.6|36.0|36.6|36.8|36.5|36.4|36.1
```

## 显示字符
#### 显示指定行
```
➜ echo "第一行\n第二行\n第三行\n第四行\n第五行"|gsed -n '4,5p'
第四行
第五行 

➜ echo "第一行\n第二行\n第三行\n第四行\n第五行"|gsed -n '2,5p'
第二行
第三行
第四行
第五行 
```
#### 匹配后输出
```
➜ sed -n '/PATH/p' ~/.zshrc|uniq|sort -u
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="/usr/local/opt/binutils/bin:$PATH"
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/findutils/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/gnu-indent/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/gnu-tar/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/gnu-which/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/mysql-client/bin:$PATH"
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"
export PATH=$HOME/.gem/ruby/2.6.0/bin:$PATH
export PATH=$HOME/Library/Python/2.7/bin:$PATH
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/dotfile/bin:$PATH
export PATH=/Library/TeX/texbin:$PATH
export PATH=/usr/local/anaconda3/bin:$PATH
export PKG_CONFIG_PATH="/usr/local/opt/mysql@5.7/lib/pkgconfig"
export PKG_CONFIG_PATH="/usr/local/opt/openssl@1.1/lib/pkgconfig"
export PKG_CONFIG_PATH=/usr/local/mysql/lib/pkgconfig
```
#### 过滤后输出匹配行
```
➜ echo "## 第一行\n第二行\n## 第三行\n第四行\n## 第五行"|gsed -n '/^#/p'
## 第一行
## 第三行
## 第五行
```
#### 过滤后统计匹配行
```
➜ pbpaste
#### 使用间断来模拟数据库
#### 使用杜威标记法给标签命名
#### 及时处理 以免被删
#### 信息数据去向
- Telegram saved message
- Telegram channel
- 微信我的手机
- QQ 我的手机
- GitHub 仓库
- SSD 硬盘
- Drafts 草稿
#### 发送给 Drafts 4 执行动作
#### 工作、家庭、休息、娱乐、学习
#### 技术类文章不建议存在 Bear 而是 repo、gist
#### Drafts save to iCloud 床上整理
#### 使用 Drafts 格式化笔记内容
  数字和字符之间的空格
  英文引号变成中文引号
  1、变成 1. 格式
  删除特殊的 \ua00a
  删除开头的空格，不需要缩进
#### 使用自定义快捷键配合 JS 收集网页资料
#### 配合 gsed 进行二次处理

➜ pbpaste|gsed -n '/^-/b ; /^[[:space:]]/b ; /^#/p'
#### 使用间断来模拟数据库
#### 使用杜威标记法给标签命名
#### 及时处理 以免被删
#### 信息数据去向
#### 发送给 Drafts 4 执行动作
#### 工作、家庭、休息、娱乐、学习
#### 技术类文章不建议存在 Bear 而是 repo、gist
#### Drafts save to iCloud 床上整理
#### 使用 Drafts 格式化笔记内容
#### 使用自定义快捷键配合 JS 收集网页资料
#### 配合 gsed 进行二次处理

➜ pbpaste|gsed -n '/^-/b ; /^[[:space:]]/b ; /^#/p'|nl
     1  #### 使用间断来模拟数据库
     2  #### 使用杜威标记法给标签命名
     3  #### 及时处理 以免被删
     4  #### 信息数据去向
     5  #### 发送给 Drafts 4 执行动作
     6  #### 工作、家庭、休息、娱乐、学习
     7  #### 技术类文章不建议存在 Bear 而是 repo、gist
     8  #### Drafts save to iCloud 床上整理
     9  #### 使用 Drafts 格式化笔记内容
    10  #### 使用自定义快捷键配合 JS 收集网页资料
    11  #### 配合 gsed 进行二次处理
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

➜ md5 -s 'JamesHopbourn'|gsed 's/MD5 ("// ; s/")// ; s/ //'
JamesHopbourn=271929258c8693b89c6f7d4e8234f98f

➜ md5 -s 'JamesHopbourn'|gsed 's/MD5 ("// ; s/")// ; s/ = /=/ ; s/.\{26\}$//'
JamesHopbourn=271929
```
#### 两种方法乱序输出文本的行
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
➜ echo "第一行\n第二行\n第三行\n第四行\n第五行"|gsed 's/行/列/'
第一列
第二列
第三列
第四列
第五列
```
#### 奇数行替换
```
➜ gseq -f "第%02g行" 1 10|sed '1~2s/^.*$/奇数行/'
奇数行
第02行
奇数行
第04行
奇数行
第06行
奇数行
第08行
奇数行
第10行
```
#### 偶数行替换
```
➜ gseq -f "第%02g行" 1 10|sed '2~2s/^.*$/偶数行/'
第01行
偶数行
第03行
偶数行
第05行
偶数行
第07行
偶数行
第09行
偶数行
```
#### 每三行替换
```
➜ gseq -f "第%02g行" 1 10|sed '3~3s/^.*$/每三行/'
第01行
第02行
每三行
第04行
第05行
每三行
第07行
第08行
每三行
第10行
```
#### 首行起每三行替换
```
➜ gseq -f "第%02g行" 1 10|sed '1~3s/^.*$/每三行/'
每三行
第02行
第03行
每三行
第05行
第06行
每三行
第08行
第09行
每三行
```
#### 正向仅仅匹配一次
```
➜ cat num
1
2
3
1
2
3
1
2
3

➜ cat num|sed '0,/2/{s/2/@/}'
1
@
3
1
2
3
1
2
3
```
#### 逆向仅仅匹配一次
```
➜ cat num
1
2
3
1
2
3
1
2
3

➜ tac num|sed '0,/2/{s/2/@/}'|tac
1
2
3
1
2
3
1
@
3
```
#### 按组匹配然后替换
```
➜ cat num
123123123
123123123
123123123
123123123
123123123
123123123

第4组 第1个 1 替换为 ~
➜ cat num|sed '4,//{s/1/~/2}'
123123123
123123123
123123123
123~23123
123~23123
123123123

第4组 全部 1 替换为 ~
➜ cat num|sed '4,//{s/3/~/g}'
123123123
123123123
123123123
12~12~12~
12~12~12~
123123123
```
#### 最后一个替换
```
➜ echo "boy\nboy\ngirl\nboy"|sed '$s/boy/boys/'
boy
boy
girl
boys
```
#### 指定位置替换
```
➜ echo 123456|gsed 's/../XX/2'
12XX56

➜ echo '110120200107042976'|gsed 's/^/00/ ; s/..../XXXX/4 ; s/^00//'
1101202001XXXX2976
```
#### 匹配字符后再替换
```
➜ echo 1000|gsed '/^1/ s/1/N/ ; /^0/ s/0/P/'
N000

➜ echo 0000|gsed '/^1/ s/1/N/ ; /^0/ s/0/P/'
P000

➜ lldb
(lldb) command script import /path/to/lldbsh.py
lldbsh.py download url
https://raw.githubusercontent.com/ihnorton/lldb.sh/master/lldbsh.py

(lldb) sh p/t 19260817|gsed 's/^.*= 0b// ; s/.\{4\}/& /g'
0000 0001 0010 0101 1110 0101 1001 0001

(lldb) sh p/t -19260817|gsed 's/^.*= 0b// ; /^1/ s/1/N/ ; /^0/ s/0/P/ ; s/.\{4\}/& /g'
N111 1110 1101 1010 0001 1010 0110 1111

(lldb) sh p/t 19260817|gsed 's/^.*= 0b// ; /^1/ s/1/N/ ; /^0/ s/0/P/ ; s/.\{4\}/& /g'
P000 0001 0010 0101 1110 0101 1001 0001

(lldb) sh p/t 19260817|gsed 's/^.*= 0b// ; /^1/ s/1/N/ ; /^0/ s/0/P/ ; s/1/2/g ; s/0/1/g ; s/2/0/g ; s/.\{4\}/& /g'
P111 1110 1101 1010 0001 1010 0110 1110 

(lldb) sh p/t 19260817|gsed 's/^.*= 0b// ; /^1/ s/1/N/ ; /^0/ s/0/P/ ; s/1/2/g ; s/0/1/g ; s/2/0/g ; s/N/1/ ; s/P/0/ ; s/.\{4\}/& /g'
0111 1110 1101 1010 0001 1010 0110 1110

(lldb) sh p/t 19890604|gsed 's/^.*= 0b// ; /^1/ s/1/N/ ; /^0/ s/0/P/ ; s/1/2/g ; s/0/1/g ; s/2/0/g ; s/N/1/ ; s/P/0/ ; s/.\{4\}/& /g'
0111 1110 1101 0000 0111 1110 0101 0011

(lldb) sh p/t -1|gsed 's/^.*= 0b// ; /^1/ s/1/N/ ; /^0/ s/0/P/ ; s/.\{4\}/& /g'
N111 1111 1111 1111 1111 1111 1111 1111
 
(lldb) sh p/t -1-1|gsed 's/^.*= 0b// ; /^1/ s/1/N/ ; /^0/ s/0/P/ ; s/1/2/g ; s/0/1/g ; s/2/0/g ; s/N/1/ ; s/P/0/ ; s/.\{4\}/& /g'
1000 0000 0000 0000 0000 0000 0000 0001
```
#### 小写转大写
```
➜ echo "你好世界"|base64
5L2g5aW95LiW55WMCg==

➜ echo "你好世界"|base64|sed 's/./\U&\E/g'
5L2g5aW95LiW55WMCg==
```
#### 大写转小写
```
➜ echo "你好世界"|base64
5L2g5aW95LiW55WMCg==

➜ echo "你好世界"|base64|sed 's/./\L&/g'
5l2g5aw95liw55wmcg==
```
#### 大小写互换
```
➜ echo "你好世界"|base64
5L2g5aW95LiW55WMCg==

➜ echo 你好世界|base64|sed 's/./&\n/g'|sed "s/[[:lower:]]/@@\U&\E/ ; s/^[[:upper:]]/\L&/ ; s/@@//"|tr -d '\n'
5l2G5Aw95lIw55wmcG==
```
#### 替换单引号
```
➜ echo "Hi,I'm James"|/usr/bin/sed "s|'|\"|"
Hi,I"m James
```
#### 多个字符匹配
```
➜ echo '0123456789'|gsed 's/\(1\|2\)/X/g'
0XX3456789

➜ echo '你发这些有什么目的？谁指使你的？你的动机是什么？你取得有关部门许可了吗？他们容许你发了吗？你背后是谁，发这些想做 什么？你在讽刺谁？想颠覆什么？破坏什么？影射什么？回答不上来？那么跟我走一趟，顺便把你家户口本带上取证！别说我们瞎抓你，都是有理有据的！'|gsed 's/\(？\|！\)/&\n/g'
你发这些有什么目的？
谁指使你的？
你的动机是什么？
你取得有关部门许可了吗？
他们容许你发了吗？
你背后是谁，发这些想做什么？
你在讽刺谁？
想颠覆什么？
破坏什么？
影射什么？
回答不上来？
那么跟我走一趟，顺便把你家户口本带上取证！
别说我们瞎抓你，都是有理有据的！
```
#### 替换单行  
```
➜ echo "第一行\n第二行\n第三行\n第四行\n第五行"|gsed '1c 替换文本'
替换文本
第二行
第三行
第四行
第五行
```
#### 替换多行  
```
➜ echo "第一行\n第二行\n 第三行\n第四行\n第五行"|gsed '1,4c 替换文本'
替换文本
第五行 
```
#### 空格替换为十六进制标志
```
➜ hexyl test.txt
┌────────┬─────────────────────────┬─────────────────────────┬────────┬────────┐
│00000000│ e6 b5 8b e8 af 95 e6 96 ┊ 87 e6 9c ac 0a          │××××××××┊××××_   │
└────────┴─────────────────────────┴─────────────────────────┴────────┴────────┘

➜ echo 'e6 b5 8b e8 af 95'|gsed 's/ /\\x/g ; s/^/\\x/'
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

➜ gsed -i 's/\xe6\x82\xa8/\xe6\x88\x91/' main

➜ ./main
我
```
#### 二进制补零对齐
```
➜ echo "JamesHopbourn" > test
┌────────┬─────────────────────────┬─────────────────────────┬────────┬────────┐
│00000000│ 4a 61 6d 65 73 48 6f 70 ┊ 62 6f 75 72 6e 0a       │JamesHop┊bourn_  │
└────────┴─────────────────────────┴─────────────────────────┴────────┴────────┘

➜ dd if=test of=test_align bs=512 conv=sync
0+1 records in
1+0 records out
512 bytes copied, 0.000354 s, 1.4 MB/s

➜ hexyl test_align
┌────────┬─────────────────────────┬─────────────────────────┬────────┬────────┐
│00000000│ 4a 61 6d 65 73 48 6f 70 ┊ 62 6f 75 72 6e 0a 00 00 │JamesHop┊bourn_00│
│00000010│ 00 00 00 00 00 00 00 00 ┊ 00 00 00 00 00 00 00 00 │00000000┊00000000│
│*       │                         ┊                         │        ┊        │
│00000200│                         ┊                         │        ┊        │
└────────┴─────────────────────────┴─────────────────────────┴────────┴────────┘
```
#### 括号斜杠字符转义
```
➜ cat name.txt|gsed "s/\[.*\]/[X]/"
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

➜ echo "C:\Windows\Folder\File.txt"|gsed -e 's|\\|/|g'
C:/Windows/Folder/File.txt
```
#### Tab 缩进删除
```
➜ pbpaste
  1. 墨菲定律
  如果有两种或两种以上的方式去做某件事情，而其中一种选择方式将导致灾难，则必定有人会做出这种选择。
  2. 波克定理
  只有在争辩中，才可能诞生最好的主意和最好的决定。
  3. 奥格尔维法则
  如果我们每个人都雇用比我们自己都更强的人，我们就能成为巨人公司。
  4. 美既好效应
  对一个外表英俊漂亮的人，人们很容易误认为他或她的其他方面也很不错。
  5. 蓝斯登定律
  和一位朋友一起工作，远较在父亲之下工作有趣得多。
  6. 洛伯定理
  对于一个经理人来说，最要紧的不是你在场时的情况，而是你不在场时发生了什么。
  7. 刺猬理论
  刺猬在天冷时彼此靠拢取暖但保持一定距离，以免互相刺伤。
  8. 托利得定理
  测验一个人的智力是否属于上乘，只看脑子里能否同时容纳两种相反的思想而无碍于其处世行事。
  9. 沃尔森法则
  把信息和情报放在第一位，金钱就会滚滚而来。
  10. 吉德林法则
  把难题清清楚楚地写出来，问题便已经解决了一半。

➜ pbpaste|sed "s/$(echo '\011')//"
1. 墨菲定律
如果有两种或两种以上的方式去做某件事情，而其中一种选择方式将导致灾难，则必定有人会做出这种选择。
2. 波克定理
只有在争辩中，才可能诞生最好的主意和最好的决定。
3. 奥格尔维法则
如果我们每个人都雇用比我们自己都更强的人，我们就能成为巨人公司。
4. 美既好效应
对一个外表英俊漂亮的人，人们很容易误认为他或她的其他方面也很不错。
5. 蓝斯登定律
和一位朋友一起工作，远较在父亲之下工作有趣得多。
6. 洛伯定理
对于一个经理人来说，最要紧的不是你在场时的情况，而是你不在场时发生了什么。
7. 刺猬理论
刺猬在天冷时彼此靠拢取暖但保持一定距离，以免互相刺伤。
8. 托利得定理
测验一个人的智力是否属于上乘，只看脑子里能否同时容纳两种相反的思想而无碍于其处世行事。
9. 沃尔森法则
把信息和情报放在第一位，金钱就会滚滚而来。
10. 吉德林法则
把难题清清楚楚地写出来，问题便已经解决了一半。
```
#### 替换正则第 1 次匹配结果 
```
➜ echo '1111 2222'|gsed 's/[0-9]\{4\}/0100/1'
0100 2222
```
#### 替换正则第 4 次匹配结果
```
➜ echo '1111 2222 3333 4444'|gsed 's/[0-9]\{4\}/0100/4'
1111 2222 3333 0100
```
#### 非贪婪匹配建议使用 perl
```
➜ echo 'https://github.com/JamesHopbourn/dotfile'|perl -pe 's/https:\/\/.*?\//ssh:\/\/personal\//'
ssh://personal/JamesHopbourn/dotfile

➜ echo 'ssh://personal/JamesHopbourn/dotfile'|perl -pe 's/ssh:\/\/.*?\//https:\/\/github.com\//'
https://github.com/JamesHopbourn/dotfile
```
#### 非贪婪匹配处理 post 请求
```
➜ pbpaste|tr "'" '"'
curl -X POST "http://172.25.249.8/eportal/InterFace.do?method=login" -H "Connection: keep-alive" -H "Origin: http://172.25.249.8" -H "User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.79 Safari/537.36" -H "DNT: 1" -H "Content-Type: application/x-www-form-urlencoded; charset=UTF-8" -H "Accept: */*" -H "Referer: http://172.25.249.8/eportal/index.jsp?userip=${CURRENT_IP}&wlanacname=&nasip=171.88.130.251&wlanparameter=${MAC_ADDRESS}&url=http://baidu.com/&userlocation=ethtrunk/3:691.3201" -H "Accept-Encoding: gzip, deflate" -H "Accept-Language: zh-CN,zh;q=0.9,zh;q=0.8,en;q=0.7" -H "Cookie: EPORTAL_COOKIE_OPERATORPWD=; EPORTAL_COOKIE_USERNAME=; EPORTAL_COOKIE_PASSWORD=; EPORTAL_COOKIE_SERVER=; EPORTAL_COOKIE_SERVER_NAME=; EPORTAL_AUTO_LAND=; EPORTAL_USER_GROUP=null; JSESSIONID=2B36EA2F20A0CE7361D592CE7DBDFED3" --data "userId=<宽带账号>&password=<宽带密码>&service=&queryString=userip%253D${CURRENT_IP}%2526wlanacname%253D%2526nasip%253D171.88.130.251%2526wlanparameter%253D${MAC_ADDRESS}%2526url%253Dhttp%253A%252F%252Fbaidu.com%252F%2526userlocation%253Dethtrunk%252F3%253A691.3201&operatorPwd=&operatorUserId=&validcode=&passwordEncrypt=false"

➜ pbpaste|tr "'" '"'|perl -pe 's/-H ".*?"/\\\n $&/g ; s/--.*? ".*?"/\\\n $&/g'
curl -X POST "http://172.25.249.8/eportal/InterFace.do?method=login" \
 -H "Connection: keep-alive" \
 -H "Origin: http://172.25.249.8" \
 -H "User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.79 Safari/537.36" \
 -H "DNT: 1" \
 -H "Content-Type: application/x-www-form-urlencoded; charset=UTF-8" \
 -H "Accept: */*" \
 -H "Referer: http://172.25.249.8/eportal/index.jsp?userip=${CURRENT_IP}&wlanacname=&nasip=171.88.130.251&wlanparameter=${MAC_ADDRESS}&url=http://baidu.com/&userlocation=ethtrunk/3:691.3201" \
 -H "Accept-Encoding: gzip, deflate" \
 -H "Accept-Language: zh-CN,zh;q=0.9,zh;q=0.8,en;q=0.7" \
 -H "Cookie: EPORTAL_COOKIE_OPERATORPWD=; EPORTAL_COOKIE_USERNAME=; EPORTAL_COOKIE_PASSWORD=; EPORTAL_COOKIE_SERVER=; EPORTAL_COOKIE_SERVER_NAME=; EPORTAL_AUTO_LAND=; EPORTAL_USER_GROUP=null; JSESSIONID=2B36EA2F20A0CE7361D592CE7DBDFED3" \
 --data "userId=<宽带账号>&password=<宽带密码>&service=&queryString=userip%253D${CURRENT_IP}%2526wlanacname%253D%2526nasip%253D171.88.130.251%2526wlanparameter%253D${MAC_ADDRESS}%2526url%253Dhttp%253A%252F%252Fbaidu.com%252F%2526userlocation%253Dethtrunk%252F3%253A691.3201&operatorPwd=&operatorUserId=&validcode=&passwordEncrypt=false"
```

## 其他用法
#### 递归修改全部匹配文件
```
➜ gsed -i 's/###/#####/g' `find . -name "*.md"`
```
#### 合并为单行建议使用 tr
```
➜ tr -d '\n' <<< $(echo "你\n好\n世\n界")
你好世界

➜ tr "\n" " " <<< $(echo "你\n好\n世\n界")
你 好 世 界
```

#### 生成本文目录
```
grep -E '^##' gsed.md|gsed 's/[[:blank:]]*$// ;  s/^## /- /g ; s/^-.*/- \[&\](&)/ ; s/- //2 ; s/- /#/2 ; s/####/    tag/g ; s/tag /\- [/g ; s/    - \[.*/&\](&)/ ; s/    - \[/#/2 ; s/(#.* /&ITISSP/g ; s/ ITISSP/-/ ; s/(#.* /&ITISSP/g ; s/ ITISSP/-/; s/(#.* /&ITISSP/g ; s/ ITISSP/-/; s/(#.* /&ITISSP/g ; s/ ITISSP/-/ ; /- \[目录\]\(.*\)/d ; /^###/d ; 2i ## 目录'|pbcopy
```

#### 生成 TOC 命令注释
```
grep -E '^##' gsed.md    | grep 过滤出所有 # 开头的行
'                          开始使用 gsed 命令处理文本
s/[[:blank:]]*$//        ; 删除末尾的空格
s/^## /- /g              ; 二级标题转为列表
s/^-.*/- \[&\](&)/       ; 二级标题添加链接
s/- //2                  ; 删除二次匹配横杆
s/- /#/2                 ; 替换括号内的横杆
s/####/    tag/g         ; 四级标题转为临时标签
s/tag /\- [/g            ; 添加左中括号
s/    - \[.*/&\](&)/     ; 添加右中括号和链接
s/    - \[/#/2           ; 删除括号内的横杠
s/(#.* /&ITISSP/g        ; 括号内的空格转为 ITISSP 临时标签
s/ ITISSP/-/             ; 删除 ITISSP 临时标签及空格
s/(#.* /&ITISSP/g        ; 括号内的空格转为 ITISSP 临时标签
s/ ITISSP/-/             ; 删除 ITISSP 临时标签及空格
s/(#.* /&ITISSP/g        ; 括号内的空格转为 ITISSP 临时标签
s/ ITISSP/-/             ; 删除 ITISSP 临时标签及空格
s/(#.* /&ITISSP/g        ; 括号内的空格转为 ITISSP 临时标签
s/ ITISSP/-/             ; 删除 ITISSP 临时标签及空格
/- \[Content\]\(.*\)/d   ; 删除之前生成的目录标题
/^###/d                  ; 排除代码区的干扰文本
2i ## Content'           | 在第一行添加二级标题目录
pbcopy                     将处理好的文本复制到剪切板
```
## 生活实际需求
#### 图片引用转为 Obsidian 格式
```
输入：![02](../../attachment/02.png)
输出：![[02.png]]

➜ echo '![02](../../attachment/02.png)'|gsed 's|!\[.*\](.*/|![[| ; s|)|]]|'
![[02.png]]
➜ gsed 's|!\[.*\](.*/|![[| ; s|)|]]|' "`find . -name "*.md"`"
➜ gsed -i 's|!\[.*\](.*/|![[| ; s|)|]]|' "`find . -name "*.md"`"

输入：![[02测试.jpeg]]
输出：![02测试](02测试.jpeg)

➜ echo '![[02测试.jpeg]]'| sed -r 's/!\[\[//g ; s/\]\]//g ; s/(.*)/![\1](\1)/ ; s/!\[(.*)\.(.*)]/![\1]/'
![02测试](02测试.jpeg)
```
#### Anki 填词挖空
```
输入：在我国，^^政府会计^^由^^预算会计^^和^^财务会计^^构成。其中，^^预算会计^^采用^^收付实现制^^，^^财务会计^^采用^^权责发生制^^。
输出：在我国，{{c1::政府会计}}由{{c2::预算会计}}和{{c3::财务会计}}构成。其中，{{c4::预算会计}}采用{{c5::收付实现制}}，{{c6::财务会计}}采用{{c7::权责发生制}}。

➜ echo '在我国，^^政府会计^^由^^预算会计^^和^^财务会计^^构成。其中，^^预算会计^^采用^^收付实现制^^，^^财务会计^^采用^^权责发生制^^。'|perl -pE 's/\^\^(.*?)\^\^/{{c::$1}}/g ; s/(.*?{{c)/\1\n/g'|awk '{print $0FNR}'|tr -d '\n'|sed 's/.$//g'
在我国，{{c1::政府会计}}由{{c2::预算会计}}和{{c3::财务会计}}构成。其中，{{c4::预算会计}}采用{{c5::收付实现制}}，{{c6::财务会计}}采用{{c7::权责发生制}}。

➜ echo '^^谨慎性^^，企业在进行会计核算时应当^^保持应有的谨慎^^，不应^^高估^^资产或者收益、^^低估^^负债或者费用。'|perl -pE 's/\^\^(.*?)\^\^/{{c::$1}}/g ; s/(.*?{{c)/\1\n/g'|awk '{print $0FNR}'|tr -d '\n'|sed 's/.$//g'
{{c1::谨慎性}}，企业在进行会计核算时应当{{c2::保持应有的谨慎}}，不应{{c3::高估}}资产或者收益、{{c4::低估}}负债或者费用。
```
#### 输出信托单位名称
```
需求：匹配「信托第[0-99][A-Z]期项下某某信托单位」再单独输出信托单位名称

➜ cat test-text
<随机长度内容>信托第A期项下A信托单位<随机长度内容>
<随机长度内容>信托第E期项下B信托单位<随机长度内容>
<随机长度内容>信托第4期项下C信托单位<随机长度内容>
<随机长度内容>信托第O期项下D信托单位<随机长度内容>
<随机长度内容>信托第12期项下E信托单位<随机长度内容>
<随机长度内容>信托第38期项下F信托单位<随机长度内容>

➜ perl -ne '/(信托第([A-Z]|[0-9][0-9]|[0-9])(期项下.*信托单位))/ &&  print "$3\n"' test-text
期项下A信托单位
期项下B信托单位
期项下C信托单位
期项下D信托单位
期项下E信托单位
期项下F信托单位
```
#### 代码开头空格转圆点
```
➜ cat 素数.c
#include <math.h>
#include <stdio.h>

int main() {
  int flag = 0, count = 0;
  for(int i = 2; i <= 100; i++) {
    for(int j = 2; j <= sqrt(i); j++)
      if(i % j == 0) {
        flag = 1;
        break;
      }
    // 输出素数 十个一行
    if(!flag) {
      printf("%d\t", i);
      if((count++) % 10 == 9) printf("\n");
    } else
      flag = 0;
    // 输出素数 十个一行
  }
}

➜ sed ':a;s/^\([[:space:]]*\)[[:space:]]/\1·/;ta' 素数.c
#include <math.h>
#include <stdio.h>

int main() {
··int flag = 0, count = 0;
··for(int i = 2; i <= 100; i++) {
····for(int j = 2; j <= sqrt(i); j++)
······if(i % j == 0) {
········flag = 1;
········break;
······}
····// 输出素数 十个一行
····if(!flag) {
······printf("%d\t", i);
······if((count++) % 10 == 9) printf("\n");
····} else
······flag = 0;
····// 输出素数 十个一行
··}
}
```
#### LF to CRLF
```
➜ echo 'Hello\nWorld'|cat -A
Hello$
World$

➜ echo 'Hello\nWorld'|sed 's/$/\r/'|cat -A
Hello^M$
World^M$
```
#### CRLF to LF
```
➜ echo 'Hello\r\nWorld\r'|cat -A
Hello^M$
World^M$

➜ echo 'Hello\r\nWorld\r'|sed 's/\r//'|cat -A
Hello$
World$
```
#### cURL decode
```
➜ pbpaste
curl 'http://banjimofang.com/student/course/25256/profiles/29?_=add' -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8' -H 'Accept-Language: en-US,en;q=0.5' --compressed -H 'Content-Type: application/x-www-form-urlencoded' -H 'Origin: http://banjimofang.com' -H 'DNT: 1' -H 'Connection: keep-alive' -H 'Referer: http://banjimofang.com/student/course/25256/profiles/29?_=add' -H 'Upgrade-Insecure-Requests: 1' -H 'Pragma: no-cache' -H 'Cache-Control: no-cache' --data-raw 'form_id=45&formdata%5Bfn_1%5D=36.2&formdata%5Bfn_2%5D=0&formdata%5Bfn_3%5D=0&formdata%5Bfn_4%5D=0&formdata%5Bfn_5%5D=%E6%97%A0&formdata%5Bfn_6%5D=%e6%b1%89%e4%b8%9c%e7%9c%81%e4%ba%ac%e5%b7%9e%e5%b8%82%e7%9c%81%e5%a7%94%e5%a4%a7%e9%99%a2&formdata%5Bgps_addr%5D=%e6%b1%89%e4%b8%9c%e7%9c%81%e4%ba%ac%e5%b7%9e%e5%b8%82%e7%9c%81%e5%a7%94%e5%a4%a7%e9%99%a2&formdata%5Bgps_xy%5D=123.45676%2C456.11488'

➜ pbpaste|tr "'" '"'|perl -pe 's/-H ".*?"/\\\n $&/g ; s/--.*? ".*?"/\\\n $&/g'|sed 's|%|\\x|g'|parallel echo
curl "http://banjimofang.com/student/course/25256/profiles/29?_=add" \
 -H "User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36" \
 -H "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8" \
 -H "Accept-Language: en-US,en;q=0.5" --compressed \
 -H "Content-Type: application/x-www-form-urlencoded" \
 -H "Origin: http://banjimofang.com" \
 -H "DNT: 1" \
 -H "Referer: http://banjimofang.com/student/course/25256/profiles/29?_=add" \
 -H "Connection: keep-alive" \
 -H "Upgrade-Insecure-Requests: 1" \
 -H "Pragma: no-cache" \
 -H "Cache-Control: no-cache" \
 --data-raw "form_id=45&formdata[fn_1]=36.2&formdata[fn_2]=0&formdata[fn_3]=0&formdata[fn_4]=0&formdata[fn_5]=无&formdata[fn_6]=汉东省京州市省委大院&formdata[gps_addr]=汉东省京州市省委大院&formdata[gps_xy]=123.45676,456.11488"
```
#### 日期格式化
```
➜ pbpaste
- 2021-01-23 19:59 Saturday
XX XXX XXXX

- 2021-01-21 22:26 Thursday
XXXXXXXXXXXXXX

- 2021-01-21 22:26 Thursday
XXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXX

- 2021-01-03 23:52 Sunday
XXXXXXXXXXXXX

➜ pbpaste|sed 's/- \(.*\)/LC_ALL=zh_CN.UTF-8 date -d"\1" "+- %Y年%m月%d日  星期%a %H:%M"/ge'
- 2021年01月23日 星期六 19:59
XX XXX XXXX

- 2021年01月21日 星期四 22:26
XXXXXXXXXXXXXX

- 2021年01月21日 星期四 22:26
XXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXX

- 2021年01月03日 星期日 23:52
XXXXXXXXXXXXX
```
#### 调试工具
```
➜ pip install --user sedsed
DEPRECATION: Python 2.7 reached the end of its life on January 1st, 2020. Please upgrade your Python as Python 2.7 is no longer maintained. pip 21.0 will drop support for Python 2.7 in January 2021. More details about Python 2 support in pip can be found at https://pip.pypa.io/en/latest/development/release-process/#python-2-support pip 21.0 will remove support for this functionality.
Collecting sedsed
  Using cached sedsed-2.0.0-py2.py3-none-any.whl (27 kB)
Collecting sedparse==0.1.*
  Using cached sedparse-0.1.2-py2.py3-none-any.whl (30 kB)
Installing collected packages: sedparse, sedsed
Successfully installed sedparse-0.1.2 sedsed-2.0.0

➜ echo '1111 2222 3333 4444'|sedsed -d 's/[0-9]\{4\}/0100/4'
PATT:1111 2222 3333 4444$
HOLD:$
COMM:s/[0-9]\{4\}/0100/4
PATT:1111 2222 3333 0100$
HOLD:$
1111 2222 3333 0100

➜ echo 'e6 b5 8b e8 af 95'|sedsed -d --hide=hold 's/ /\\x/g ; s/^/\\x/'
PATT:e6 b5 8b e8 af 95$
COMM:s/ /\\x/g
PATT:e6\\xb5\\x8b\\xe8\\xaf\\x95$
COMM:s/^/\\x/
PATT:\\xe6\\xb5\\x8b\\xe8\\xaf\\x95$
\xe6\xb5\x8b\xe8\xaf\x95
```

## gsed 参考资料  
[SED 简明教程](https://coolshell.cn/articles/9104.html)  
[三十分钟学会SED](https://github.com/mylxsw/growing-up/blob/master/doc/三十分钟学会SED.md)  
[sed 命令详解 & 正则表达式](https://blog.csdn.net/gua___gua/article/details/49304699) 
[使用 sed 命令替换/删除 文本字符的 20 个例子](https://segmentfault.com/a/1190000020613397)   
[sed 命令，Linux sed 命令详解：功能强大的流式文本编辑器](https://wangchujiang.com/linux-command/c/sed.html)  
[Sed and awk 笔记之 sed 篇：实战](https://www.jianshu.com/p/b63770600129)  
[Sed and awk 笔记之 sed 篇：基础命令](https://kodango.com/sed-and-awk-notes-part-3)  
[Sed and awk 笔记之 sed 篇：高级命令（一）](https://kodango.com/sed-and-awk-notes-part-4)  
[Sed substitution and external command](https://stackoverflow.com/questions/18957889/sed-substitution-and-external-command)
