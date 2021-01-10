#### 查看文件
```
➜ cat test.c
#include <stdio.h>

int main(int argc, char const *argv[])
{
	printf("Hello World\n");
	return 0;
}
```

#### 显示不可见字符
```
➜ cat -T test.c
#include <stdio.h>

int main(int argc, char const *argv[])
{
^Iprintf("Hello World\n");
^Ireturn 0;
}
```

#### 显示结尾位置
```
➜ cat -E test.c
#include <stdio.h>$
$
int main(int argc, char const *argv[])$
{$
	printf("Hello World\n");$
	return 0;$
}$
```

#### 同时显示结尾和不可见字符
```
➜ cat -A test.c
#include <stdio.h>$
$
int main(int argc, char const *argv[])$
{$
^Iprintf("Hello World\n");$
^Ireturn 0;$
}$
```

#### 查看 nl 显示效果举例
```
➜ nl test.c
     1	#include <stdio.h>

     2	int main(int argc, char const *argv[]){
     3		printf("Hello World\n");
     4		return 0;
     5	}

➜ nl test.c|cat -A
     1^I#include <stdio.h>$
       $
     2^Iint main(int argc, char const *argv[]){$
     3^I^Iprintf("Hello World\n");$
     4^I^Ireturn 0;$
     5^I}$

➜ nl test.c|sed "s/$(echo '\011')/ /g"|cat -A
     1 #include <stdio.h>$
       $
     2 int main(int argc, char const *argv[]){$
     3  printf("Hello World\n");$
     4  return 0;$
     5 }$

➜ nl test.c|sed "s/$(echo '\011')/ /g ; s/^[[:space:]]\{5\}//"
1 #include <stdio.h>

2 int main(int argc, char const *argv[]){
3  printf("Hello World\n");
4  return 0;
5 }
```