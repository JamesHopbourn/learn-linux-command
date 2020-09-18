## 编辑文本文件
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

## 编辑二进制文件
#### 编辑代码
```
➜ vim dd.c
#include <stdio.h>

int main(int argc, char const *argv[]) { printf("Hello World\n"); }

[ESC]:wq
```

#### 编译代码 运行程序
```
➜ gcc dd.c -o dd;./dd
Hello World
```

#### 打印字符串十进制偏移量
```
➜ strings -t d dd | grep  'Hello World'
16298 Hello World
```

#### 创建字符串替换文件
```
➜ printf "Hello Github\x0A" > strings
```

#### 替换字符串
```
➜ dd if=strings of=dd obs=1 seek=16298  conv=notrunc
0+1 records in
13+0 records out
13 bytes copied, 0.0004 s, 32 kB/s
```

#### 运行修改后的程序
```
➜ ./dd
Hello Github
```