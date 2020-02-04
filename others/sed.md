macOS 使用 sed 建议：alias sed="sed -i ''"  
  
## 添加字符  
行首添加  
sed 's/^/ /' test.txt  
sed '2,5s/^/ /' test.txt  
  
行尾添加 多用于 GitHub README.md  
sed 's/$/ /' test.txt  

##### 匹配后添加
cat sed.md|sed 's/^删除/##### &/' sed.md

## 删除字符  
删除空行  
sed '/^$/d'  
删除首行  
sed '1d' test.txt  
删除末行  
sed '$d' test.txt  
删除指定行，例如第5行  
sed '5d' test.txt  
删除第1到2行：  
sed '1,2d' test.txt  
  
## 显示某行然后复制  
sed -n '4,5p' test.txt|pbcopy  
sed -n '4,$p' test.txt|pbcopy  
  
## 替换字符  
全局替换  
sed 's/ruby/bird/g' test.txt  
[替换单引号](https://blog.csdn.net/wangbole/article/details/8250271)  
echo "hi i'm kangkang"|sed 's/'"'"/'"''/'  
替换单行  
sed '1c Hi' ab  
替换多行  
sed '1,2c Hi' ab  
  
sed 详解  
https://blog.csdn.net/gua___gua/article/details/49304699  
https://www.linuxidc.com/Linux/2018-10/154768.htm  
