#### 输出当前路径
```
➜ pwd
/Users/james/code/learn-linux-command
```
#### 输出当前目录名
```
➜ pwd|xargs basename
learn-linux-command
```
#### 输出根目录名
```
➜ pwd|rev|xargs -d '\n' basename|rev
Users
```
#### 输出文件名
```
➜ basename README.md
README.md
```
#### 文件名去除后缀输出
```
➜ basename README.md .md
README
```
#### 过滤出所有源文件替换为 .o 后缀
```
➜ ls
bool.cpp  queue.cpp  string.cpp     vector.cpp
makefile  stack.cpp  unordered_map.cpp

➜ find . -iname "*.cpp"|xargs -n 1 basename -s .cpp|sed 's/$/.o/'
string.o
stack.o
vector.o
queue.o
unordered_map.o
bool.o
```
#### 输出除了目录名的路径
```
➜ pwd|xargs dirname
/Users/james/code
```

[Tell `ls` to print only the base filename](https://superuser.com/questions/97905/tell-ls-to-print-only-the-base-filename)
[To show only file name without the entire directory path](https://stackoverflow.com/questions/8518750/to-show-only-file-name-without-the-entire-directory-path/26887762)