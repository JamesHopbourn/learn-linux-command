## 目录
- [指鹿为马](#指鹿为马)
    - [编写源文件](#编写源文件)
    - [编译为 PDF](#编译为-PDF)
    - [解压 PDF 内容](#解压-PDF-内容)
    - [修改鹿的 Unicode 为马的](#修改鹿的-Unicode-为马的)
    - [压缩 PDF 内容](#压缩-PDF-内容)
- [隐写 flag](#隐写-flag)
    - [编写源文件](#编写源文件)
    - [编译为 PDF](#编译为-PDF)
    - [解压 PDF 内容](#解压-PDF-内容)
    - [获取 ASCII 码](#获取-ASCII-码)
    - [修改字符映射表](#修改字符映射表)
    - [预览 PDF 内容](#预览-PDF-内容)

## 指鹿为马
#### 编写源文件
```
➜ echo '鹿' > deer.md
```

#### 编译为 PDF
```
➜ pandoc deer.md --pdf-engine=xelatex -V mainfont='Songti SC' -o deer.pdf
```

#### 解压 PDF 内容
```
➜ qpdf --qdf --object-streams=disable deer.pdf expanded.pdf
```

#### 修改鹿的 Unicode 为马的
```
➜ gsed -n '139,142p' expanded.pdf
2 beginbfchar
<0014> <0031>
<0FC7> <9E7F>
endbfchar

➜ python3 -c 'print("鹿".encode("unicode_escape").upper())'|gsed "s/^.\{5\}// ; s/.\{1\}$//"
9E7F

➜ python3 -c 'print("马".encode("unicode_escape").upper())'|gsed "s/^.\{5\}// ; s/.\{1\}$//"
9A6C

➜ sed -i 's/9E7F/9A6C/' expanded.pdf
```

#### 压缩 PDF 内容
```
➜ qpdf --stream-data=compress expanded.pdf NewDeer.pdf
➜ open -a Preview NewDeer.pdf
```

## 隐写 flag
#### 编写源文件
```
echo 'password:S02E25T' > password.md
```

#### 编译为 PDF
```
➜ pandoc password.md --pdf-engine=xelatex -V mainfont='Songti SC' -o password.pdf
```

#### 解压 PDF 内容
```
➜ qpdf --qdf --object-streams=disable password.pdf expanded-password.pdf
```

#### 获取 ASCII 码
```
echo word|hexdump
0000000 77 6f 72 64 0a
0000005

echo flag|hexdump
0000000 66 6c 61 67 0a
0000005

echo ST|hexdump
0000000 53 54 0a
0000003

echo {}|hexdump
0000000 7b 7d 0a
0000003
```

#### 修改字符映射表
```
12 beginbfchar
<0018> <0035>
<001D> <003A>
<0028> <0045>
<0036> <0053>
<0037> <0054>
<0044> <0061>
<0047> <0064>
<0052> <006F>
<0053> <0070>
<0055> <0072>
<0056> <0073>
<005A> <0077>

%% redefine text %%

<0047> <0067>
<0052> <006c>
<0055> <0061>
<005A> <0066>
<0036> <007B>
<0037> <007D>
endbfchar
```

#### 预览 PDF 内容
```
➜ open -a Preview NewPassword.pdf
显示字符：password:S02E25T
实际字符：passflag:{02E25}
```