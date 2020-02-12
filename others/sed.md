## 注意事项：  
macOS 上的 sed 并不是 GNU Project 亲生的，苹果对其稍微进行了修改，主要体现在需要添加备份参数和 \n 转义上。
如果不习惯使用 macOS 的 sed 可以使用 gsed 替代：  

## 添加字符  
```
brew install gnu-sed  
```
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

➜ sed -e '1i\
在第一行之前添加一行' test.txt

➜ sed -e '1a\
在第一行之后添加一行' test.txt

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

#### 匹配后添加
```
➜ echo -e "标题一\n标题二\n标题三"|sed 's/^标题/### &/'
### 标题一
### 标题二
### 标题三
```

## 删除字符  
##### 删除空行  
```
➜ echo -e "第一行\n第二行\n\n\n第四行\n第五行"|sed '/^$/d
'
第一行
第二行
第四行
第五行
```
##### 删除首行  
```
➜ echo -e "第一行\n第二行\n第三行\n第四行\n第五行"|sed '1d'
第二行
第三行
第四行
第五行
```
##### 删除末行  
```
➜ echo -e "第一行\n第二行\n第三行\n第四行\n第五行"|sed '$d'
第一行
第二行
第三行
第四行

```
##### 删除指定行，例如第3行  
```
➜ echo -e "第一行\n第二行\n第三行\n第四行\n第五行"|sed '3d'
第一行
第二行
第四行
第五行
```
##### 删除第1到2行：  
```
➜ echo -e "第一行\n第二行\n第三行\n第 四行\n第五行"|sed '1,2d'
第三行
第四行
第五行
```
  
## 显示某行然后复制  
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
##### 替换单行  
```
➜ sed '1c Hi' test.txt  
```
##### 替换多行  
```
➜ sed '3,6s/my/your/g' test.txt  
```
##### 替换正则第 4 次匹配结果
```
➜ sed -E '1s/[0-9]{4}/0100/4 test.txt
```
##### 非贪婪匹配建议使用 perl
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
➜ tr  "\n" " " < old.txt > new.txt
```
#### 正则表达式
```
➜ sed -E '1s/[0-9]{4}/0100/4 test.txt
```

## sed 参考资料  
[SED 简明教程](https://coolshell.cn/articles/9104.html)  
[三十分钟学会SED](https://github.com/mylxsw/growing-up/blob/master/doc/三十分钟学会SED.md)  
[sed 命令详解 & 正则表达式](https://blog.csdn.net/gua___gua/article/details/49304699)    
  
