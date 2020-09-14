## 注意事项   
macOS 上的 sed 并不是 GNU Project 亲生的，苹果对其稍微进行了修改，主要体现在需要添加备份参数和 \n 转义上。
如果不习惯使用 macOS 的 sed 可以使用 gsed 替代：  
```
brew install gnu-sed  
```

## 添加字符  
#### 行首添加
```
➜ echo '文本'|sed 's/^/开头/'
开头文本
```
#### 指定行添加  
```
➜ echo -e "第一行\n第二行\n第三行\n第四行\n第五行"|sed '2,3s/^/  /'
第一行
  第二行
  第三行
第四行
第五行
```
#### 行尾添加 多用于 GitHub README.md  
```
➜ echo -e "第一行\n第二行\n第三行\n第四行\n第五行"|sed '2,3s/$/结尾/'
第一行
第二行结尾
第三行结尾
第四行
第五行
```
#### 跨行添加
```
➜ echo '一二'|sed  $'s/二/\\\n&/'
一
二

➜ echo '一二'|gsed  's/二/\n&/'
一
二

➜ echo '第一行'|sed -e '1i\
pipe quote> 在第一行之前添加一行'
在第一行之前添加一行
第一行

➜ echo '第一行'|sed -e '1a\
pipe quote> 在第一行之后添加一行'
第一行
在第一行之后添加一行

➜ sed "/匹配字符/i\\
字符上面添加一行\\
" 文件名

➜ sed "/匹配字符/a\\
字符下面添加一行\\
" 文件名

➜ echo -e 'line 1\nline 2\nline 3'|gsed '1i test'
test
line 1
line 2
line 3

➜ echo -e 'line 1\nline 2\nline 3'|gsed '2i test'
line 1
test
line 2
line 3

➜ echo -e 'line 1\nline 2\nline 3'|gsed '$i test'
line 1
line 2
test
line 3

➜ echo -e 'line 1\nline 2\nline 3'|gsed '$a test'
line 1
line 2
line 3
test
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
➜ echo -e "标题一\n标题二\n标题三"|sed 's/^标题/### &/'
### 标题一
### 标题二
### 标题三
```
#### 间隔添加
```
➜ echo ef2d9dad22f7342c62a9bed2a65dc8b5 | sed 's/.\{2\}/\\x&/g'
\xef\x2d\x9d\xad\x22\xf7\x34\x2c\x62\xa9\xbe\xd2\xa6\x5d\xc8\xb5
```

## 删除字符  
#### 删除空行  
```
➜ echo -e "第一行\n第二行\n\n\n第四行\n第五行"|sed '/^$/d'
第一行
第二行
第四行
第五行
```
#### 删除首行  
```
➜ echo -e "第一行\n第二行\n第三行\n第四行\n第五行"|sed '1d'
第二行
第三行
第四行
第五行
```
#### 删除末行  
```
➜ echo -e "第一行\n第二行\n第三行\n第四行\n第五行"|sed '$d'
第一行
第二行
第三行
第四行
```
#### 删除指定行，例如第3行  
```
➜ echo -e "第一行\n第二行\n第三行\n第四行\n第五行"|sed '3d'
第一行
第二行
第四行
第五行
```
#### 删除第1到2行：  
```
➜ echo -e "第一行\n第二行\n第三行\n第四行\n第五行"|sed '1,2d'
第三行
第四行
第五行
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

➜ cat if.s | sed 's/^.\{36\}//'
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

➜ cat if.s|sed -e 's/:.\{23\}/: /g' -e 's/^.\{3\}//'
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
  
## 显示某行
```
➜ echo -e "第一行\n第二行\n第三行\n第四行\n第五行"|sed -n '4,5p'
第四行
第五行 

➜ echo -e "第一行\n第二行\n第三行\n第四行\n第五行"|sed -n '2,5p'
第二行
第三行
第四行
第五行 
```
  
## 替换字符  
#### 全局替换  
```
➜ echo -e "第一行\n第二行\n第三行\n第四行\n第五行"|sed 's/行/列/'
第一列
第二列
第三列
第四列
第五列
```
#### [替换单引号](https://blog.csdn.net/wangbole/article/details/8250271)  
```
➜ echo "hi i'm kangkang"|sed 's/'"'"/'"''/'  
hi i"m kangkang
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
#### 替换正则第 1 次匹配结果 
```
➜ echo '1111 2222'|sed -E '1s/[0-9]{4}/0100/'
0100 2222
```
#### 替换正则第 4 次匹配结果
```
➜ echo '1111 2222 3333 4444'|sed -E '1s/[0-9]{4}/0100/4'
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
➜ sed 's/ /0/g' ; 's/#/1/g' test.txt
➜ sed -e 's/ /0/g' -e 's/#/1/g' test.txt
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
  
