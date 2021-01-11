#### 查看文件
```
➜ cat test.c
#include <stdio.h>

int main(int argc, char const *argv[]){
	printf("Hello World\n");
	return 0;
}
```
#### 删除连续换行
```
➜ cat test.c
#include <stdio.h>




int main(int argc, char const *argv[]){
    printf("Hello World\n");
    return 0;
}

➜ cat -s test.c
#include <stdio.h>

int main(int argc, char const *argv[]){
    printf("Hello World\n");
    return 0;
}
```
#### 显示TAB缩进
```
➜ cat -T test.c
#include <stdio.h>

int main(int argc, char const *argv[]){
^Iprintf("Hello World\n");
^Ireturn 0;
}
```
#### 显示结尾位置
```
➜ cat -E test.c
#include <stdio.h>$
$
int main(int argc, char const *argv[]){$
	printf("Hello World\n");$
	return 0;$
}$
```
#### 同时显示结尾和TAB缩进
```
➜ cat -A test.c
#include <stdio.h>$
$
int main(int argc, char const *argv[]){$
^Iprintf("Hello World\n");$
^Ireturn 0;$
}$
```
#### 显示行号
```
➜ cat -n test.c
     1  #include <stdio.h>
     2
     3  int main(int argc, char const *argv[]){
     4      printf("Hello World\n");
     5      return 0;
     6  }

➜ cat -b test.c
     1	#include <stdio.h>

     2	int main(int argc, char const *argv[]){
     3		printf("Hello World\n");
     4		return 0;
     5	}

➜ cat -b test.c|cat -A
     1^I#include <stdio.h>$
       $
     2^Iint main(int argc, char const *argv[]){$
     3^I^Iprintf("Hello World\n");$
     4^I^Ireturn 0;$
     5^I}$

➜ cat -b test.c|sed "s/$(echo '\011')/ /g"|cat -A
     1 #include <stdio.h>$
       $
     2 int main(int argc, char const *argv[]){$
     3  printf("Hello World\n");$
     4  return 0;$
     5 }$

➜ cat -b test.c|sed "s/$(echo '\011')/ /g ; s/^[[:space:]]\{5\}//"
1 #include <stdio.h>

2 int main(int argc, char const *argv[]){
3  printf("Hello World\n");
4  return 0;
5 }
```
#### 使用 ^ 和 M- 引用
```
➜ echo 你好世界|cat -v
M-dM-=M- M-eM-%M-=M-dM-8M-^VM-gM-^UM-^L

➜ vim script
#!/usr/bin/perl
for($i=0 ; $i < 256; $i++){
  print(sprintf("%c is %d %x\n", $i, $i ,$i));
}

➜ perl script|cat -A|sed 's/.$//'
^@ is 0 0
^A is 1 1
^B is 2 2
^C is 3 3
^D is 4 4
^E is 5 5
^F is 6 6
^G is 7 7
^H is 8 8
^I is 9 9
(10 is NL)
   is 10 a
^K is 11 b
^L is 12 c
^M is 13 d
^N is 14 e
^O is 15 f
^P is 16 10
^Q is 17 11
^R is 18 12
^S is 19 13
^T is 20 14
^U is 21 15
^V is 22 16
^W is 23 17
^X is 24 18
^Y is 25 19
^Z is 26 1a
^[ is 27 1b
^\ is 28 1c
^] is 29 1d
^^ is 30 1e
^_ is 31 1f
  is 32 20
! is 33 21
" is 34 22
# is 35 23
$ is 36 24
% is 37 25
& is 38 26
' is 39 27
( is 40 28
) is 41 29
* is 42 2a
+ is 43 2b
, is 44 2c
- is 45 2d
. is 46 2e
/ is 47 2f
0 is 48 30
1 is 49 31
2 is 50 32
3 is 51 33
4 is 52 34
5 is 53 35
6 is 54 36
7 is 55 37
8 is 56 38
9 is 57 39
: is 58 3a
; is 59 3b
< is 60 3c
= is 61 3d
> is 62 3e
? is 63 3f
@ is 64 40
A is 65 41
B is 66 42
C is 67 43
D is 68 44
E is 69 45
F is 70 46
G is 71 47
H is 72 48
I is 73 49
J is 74 4a
K is 75 4b
L is 76 4c
M is 77 4d
N is 78 4e
O is 79 4f
P is 80 50
Q is 81 51
R is 82 52
S is 83 53
T is 84 54
U is 85 55
V is 86 56
W is 87 57
X is 88 58
Y is 89 59
Z is 90 5a
[ is 91 5b
\ is 92 5c
] is 93 5d
^ is 94 5e
_ is 95 5f
` is 96 60
a is 97 61
b is 98 62
c is 99 63
d is 100 64
e is 101 65
f is 102 66
g is 103 67
h is 104 68
i is 105 69
j is 106 6a
k is 107 6b
l is 108 6c
m is 109 6d
n is 110 6e
o is 111 6f
p is 112 70
q is 113 71
r is 114 72
s is 115 73
t is 116 74
u is 117 75
v is 118 76
w is 119 77
x is 120 78
y is 121 79
z is 122 7a
{ is 123 7b
| is 124 7c
} is 125 7d
~ is 126 7e
^? is 127 7f
M-^@ is 128 80
M-^A is 129 81
M-^B is 130 82
M-^C is 131 83
M-^D is 132 84
M-^E is 133 85
M-^F is 134 86
M-^G is 135 87
M-^H is 136 88
M-^I is 137 89
M-^J is 138 8a
M-^K is 139 8b
M-^L is 140 8c
M-^M is 141 8d
M-^N is 142 8e
M-^O is 143 8f
M-^P is 144 90
M-^Q is 145 91
M-^R is 146 92
M-^S is 147 93
M-^T is 148 94
M-^U is 149 95
M-^V is 150 96
M-^W is 151 97
M-^X is 152 98
M-^Y is 153 99
M-^Z is 154 9a
M-^[ is 155 9b
M-^\ is 156 9c
M-^] is 157 9d
M-^^ is 158 9e
M-^_ is 159 9f
M-  is 160 a0
M-! is 161 a1
M-" is 162 a2
M-# is 163 a3
M-$ is 164 a4
M-% is 165 a5
M-& is 166 a6
M-' is 167 a7
M-( is 168 a8
M-) is 169 a9
M-* is 170 aa
M-+ is 171 ab
M-, is 172 ac
M-- is 173 ad
M-. is 174 ae
M-/ is 175 af
M-0 is 176 b0
M-1 is 177 b1
M-2 is 178 b2
M-3 is 179 b3
M-4 is 180 b4
M-5 is 181 b5
M-6 is 182 b6
M-7 is 183 b7
M-8 is 184 b8
M-9 is 185 b9
M-: is 186 ba
M-; is 187 bb
M-< is 188 bc
M-= is 189 bd
M-> is 190 be
M-? is 191 bf
M-@ is 192 c0
M-A is 193 c1
M-B is 194 c2
M-C is 195 c3
M-D is 196 c4
M-E is 197 c5
M-F is 198 c6
M-G is 199 c7
M-H is 200 c8
M-I is 201 c9
M-J is 202 ca
M-K is 203 cb
M-L is 204 cc
M-M is 205 cd
M-N is 206 ce
M-O is 207 cf
M-P is 208 d0
M-Q is 209 d1
M-R is 210 d2
M-S is 211 d3
M-T is 212 d4
M-U is 213 d5
M-V is 214 d6
M-W is 215 d7
M-X is 216 d8
M-Y is 217 d9
M-Z is 218 da
M-[ is 219 db
M-\ is 220 dc
M-] is 221 dd
M-^ is 222 de
M-_ is 223 df
M-` is 224 e0
M-a is 225 e1
M-b is 226 e2
M-c is 227 e3
M-d is 228 e4
M-e is 229 e5
M-f is 230 e6
M-g is 231 e7
M-h is 232 e8
M-i is 233 e9
M-j is 234 ea
M-k is 235 eb
M-l is 236 ec
M-m is 237 ed
M-n is 238 ee
M-o is 239 ef
M-p is 240 f0
M-q is 241 f1
M-r is 242 f2
M-s is 243 f3
M-t is 244 f4
M-u is 245 f5
M-v is 246 f6
M-w is 247 f7
M-x is 248 f8
M-y is 249 f9
M-z is 250 fa
M-{ is 251 fb
M-| is 252 fc
M-} is 253 fd
M-~ is 254 fe
M-^? is 255 ff

➜ echo '你好世界'|cat -v|sed 's/\(M*M\)/&\n/g'|sed '1d ; s/M//g ; s/^/M/g'
M-d
M-=
M-
M-e
M-%
M-=
M-d
M-8
M-^V
M-g
M-^U
M-^L

M-d: 228 e4
M-=: 189 bd
M- : 160 a0

➜ echo 你|hexdump
0000000 e4 bd a0 0a
0000004

汉字 → 十六进制 → 编码表
```
#### 其他玩法
```
➜ echo '你好世界'|cat -v
M-dM-=M- M-eM-%M-=M-dM-8M-^VM-gM-^UM-^L

➜ echo '你好世界'|cat -v|sed 's/\(M*M\)/&\n/g'|sed '1d ; s/M//g ; s/^/M/g'
M-d
M-=
M-
M-e
M-%
M-=
M-d
M-8
M-^V
M-g
M-^U
M-^L

➜ echo '你好世界'|cat -v|sed 's/M-//g'
d= e%=d8^Vg^U^L

➜ echo 'd= e%=d8^Vg^U^L'|sed 's/\(.\)/M-&/g ; s/\^M-/^/g'
M-dM-=M- M-eM-%M-=M-dM-8M-^VM-gM-^UM-^L
```

#### 参考资料
[What is the “M- notation” and where is it documented?](https://stackoverflow.com/questions/44694331/what-is-the-m-notation-and-where-is-it-documented)  
[How to remove special 'M-BM-' character with sed](https://askubuntu.com/questions/357248/how-to-remove-special-m-bm-character-with-sed)  


