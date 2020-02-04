## 添加字符  
#### 行首添加
```
sed 's/^/ /' test.txt  
```
#### 指定行添加  
```
sed '2,5s/^/ /' test.txt  
```
#### 行尾添加 多用于 GitHub README.md  
```
sed 's/$/ /' test.txt  
```
#### 跨行添加 多用于添加 code 标记
```
sed $'s/sed/```\\\nsed/g'

sed -e '1i\
在第一行之前添加一行' test.txt

sed -e '1a\
在第一行之后添加一行' test.txt

sed "/匹配字符/i\\
字符上面添加一行\\
" 文件名

sed "/匹配字符/a\\
字符下面添加一行\\
" 文件名
```

#### 匹配后添加
```
cat sed.md|sed 's/^删除/#### &/' sed.md
```

## 删除字符  
##### 删除空行  
```
sed '/^$/d'  
```
##### 删除首行  
```
sed '1d' test.txt  
```
##### 删除末行  
```
sed '$d' test.txt  
```
##### 删除指定行，例如第5行  
```
sed '5d' test.txt  
```
##### 删除第1到2行：  
```
sed '1,2d' test.txt  
```
  
## 显示某行然后复制  
```
sed -n '4,5p' test.txt|pbcopy  
sed -n '4,$p' test.txt|pbcopy  
```
  
## 替换字符  
#### 全局替换  
```
sed 's/ruby/bird/g' test.txt  
```
#### [替换单引号](https://blog.csdn.net/wangbole/article/details/8250271)  
```
echo "hi i'm kangkang"|sed 's/'"'"/'"''/'  
```
##### 替换单行  
```
sed '1c Hi' test.txt  
```
##### 替换多行  
```
sed '1,2c Hi' test.txt  
```
  
## sed 详解  
https://blog.csdn.net/gua___gua/article/details/49304699  
https://www.linuxidc.com/Linux/2018-10/154768.htm  

## 注意事项：  
macOS 上的 sed 并不是 GNU Project 的亲儿子，苹果对其稍微进行了修改，主要体现在需要添加备份参数和 \n 转义上。
如果你不习惯使用 macOS 的 sed 可以使用 gsed 替代：  
```
brew install gnu-sed  
```
