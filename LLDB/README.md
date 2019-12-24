## 配置  
settings set target.x86-disassembly-flavor intel  
settings set target.max-memory-read-size 0x1000  
  
command alias bp breakpoint set -a %1  
command alias bl breakpoint list  
command alias rtc breakpoint set -o -a %1  
command alias pof expression -OAv -- %1  
command alias conn process connect --plugin gdb-remote connect://127.0.0.1:4321 command alias fo target modules lookup -a %1  

## 调试  
命令行lldb 文件名  
LLDB 命令target create 文件名  
  
## 断点  
breakpoint set --name main  
b main  
br s -a 0x100000f2f  
  
  
## 调试操作  
r  
s  
c  
n  
  
## 变量  
p a  
po int $var=10  
p $var  
p/x a  
p/t a  

(lldb) expr char *$str = (char *)malloc(8)  
(lldb) expr (void)strcpy($str, "munkeys")  
(lldb) expr $str[1] = 'o'  
(char) $0 = 'o'  
(lldb) p $str  
(char *) $str = 0x00007fd04a900040 "monkeys"  

  
## 设置变量  
expr var=10  
  
x/1dw 0x1243546  
x/9dw 0x123456  
  
