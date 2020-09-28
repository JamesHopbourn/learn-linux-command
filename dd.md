## 目录
- [修改文本文件](#修改文本文件)
    - [新建测试文件](#新建测试文件)
    - [替换一个字符](#替换一个字符)
    - [查看效果](#查看效果)
    - [替换四个字符](#替换四个字符)
    - [查看效果](#查看效果)
    - [不加 conv=notrunc 参数从起始处全部替换](#不加-conv=notrunc-参数从起始处全部替换)
    - [查看效果](#查看效果)
- [修改二进制文件](#修改二进制文件)
    - [编辑代码](#编辑代码)
    - [编译代码 运行程序](#编译代码-运行程序)
    - [打印字符串十进制偏移量](#打印字符串十进制偏移量)
    - [替换字符串](#替换字符串)
    - [运行修改后的程序](#运行修改后的程序)
    - [替换字符串](#替换字符串)
    - [运行修改后的程序](#运行修改后的程序)

## 修改文本文件
#### 新建测试文件
```
➜ echo '1234567890' > test
```

#### 替换一个字符
```
➜ echo 'X' | dd of=test bs=1 seek=5 count=1 conv=notrunc
1+0 records in
1+0 records out
1 byte copied, 0.000109 s, 9.2 kB/s
```

#### 查看效果
```
➜ cat test
12345X7890
```

#### 替换四个字符
```
➜ echo 'XXXX' | dd of=test bs=1 seek=5 count=4 conv=notrunc
4+0 records in
4+0 records out
4 bytes copied, 0.000647 s, 6.2 kB/s
```

#### 查看效果
```
➜ cat test
12345XXXX0
```

#### 不加 conv=notrunc 参数从起始处全部替换
```
➜ echo 'X' | dd of=test bs=1 seek=5 count=1
1+0 records in
1+0 records out
1 byte copied, 0.000156 s, 6.4 kB/s
```

#### 查看效果
```
➜ cat test
12345X
```

## 修改二进制文件
#### 编辑代码
```
➜ vim Hello.c
#include <stdio.h>

int main() { printf("Hello World\n"); }

[ESC]:wq
```

#### 编译代码 运行程序
```
➜ gcc Hello.c -o Hello;./Hello
Hello World
```

#### 打印字符串十进制偏移量
```
➜ strings -t d Hello|grep  'Hello World'
16294 Hello World
```

#### 替换字符串
```
➜ printf "Hello Github\x0A"|dd of=Hello obs=1 seek=16294  conv=notrunc
0+1 records in
13+0 records out
13 bytes copied, 0.000482 s, 27.0 kB/s
```

#### 运行修改后的程序
```
➜ ./Hello
Hello Github
```

#### 替换字符串
```
➜ printf "你好世界\x0A"|dd of=Hello obs=1 seek=16294 conv=notrunc
0+1 records in
13+0 records out
13 bytes copied, 0.000429 s, 30.3 kB/s
```

#### 运行修改后的程序
```
➜ ./Hello
你好世界
```
