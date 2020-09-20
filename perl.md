## 修改英文字符串二进制文件
#### 编辑代码
```
➜ vim main.c
#include <stdio.h>

int main(int argc, char const *argv[])
{
	char *strings;
	strings = "test";
	printf("%s\n", strings);
	return 0;
}

[ESC]:wq
```

#### 编译代码 运行程序
```
➜ gcc main.c -o main;./main
test
```

#### 替换英文字符串
```
➜ perl -i.bak -pe 's|test|just|' main
```

#### 运行程序
```
./main
just
```

## 修改中文字符串二进制文件
```
➜ vim main.c
#include <stdio.h>

int main(int argc, char const *argv[])
{
	char *strings;
	strings = "您";
	printf("%s\n", strings);
	return 0;
}

[ESC]:wq
```

#### 编译代码 运行程序
```
➜ gcc main.c -o main;./main
您
```

#### 中文编码
```
➜ python3 -c 'print("您".encode("utf-8"))'
b'\xe6\x82\xa8'

➜ python3 -c 'print("我".encode("utf-8"))'
b'\xe6\x88\x91'
```

#### 替换中字符串
```
➜ perl -i.bak -pe 's|\xe6\x82\xa8|\xe6\x88\x91|' main
```

#### 运行程序
```
➜ ./main
我
```