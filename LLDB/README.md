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
  
## 打印变量  
p a  
po int $var=10  
p $var  
p/x a  
p/t a  
  
## 设置变量  
expr var=10  
  
x/1dw 0x1243546  
x/9dw 0x123456  
  
