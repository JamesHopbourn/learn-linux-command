#### 栈生长方向
```
➜ vim address.c
#include <stdio.h>

int main(int argc, char const *argv[]) {
  int a, b;
  printf("Address of a: %p\n", (void *)&a);
  printf("Address of b: %p\n", (void *)&b);
}

[ESC] :wq

➜ gcc address.c -o macOS;./macOS
Address of a: 0x7ffee6b9e29c
Address of b: 0x7ffee6b9e298

➜ python
>>> 0x7ffee6b9e29c
140732769362588
>>> 0x7ffee6b9e298
140732769362584
```
**结论：栈生长方向从高地址到低地址**

#### rsp rbp 寄存器
```
rbp = register base  pointer 是指向当前栈帧底部的寄存器
rsp = register stack pointer 是指向当前栈帧顶部的寄存器

➜ vim stack.c;gcc stack.c -o stack

#include <stdio.h>

int main(void)
{
	int a;
	a = 972;
	printf("a = %d\n", a);
	return (0);
}

[ESC] :wq

➜ objdump -d -j .text -M intel rsp|gsed '1,6d ; s/^.\{3\}// ; s/:.\{23\}/ / ; /^.\{14\}/ s/  //'
0000100003f50 <_main>:
100003f50 push rbp
100003f51 mov  rbp,rsp
100003f54 sub  rsp,0x10
100003f58 mov  DWORD PTR [rbp-0x4],0x0
100003f5f mov  DWORD PTR [rbp-0x8],0x3cc
100003f66 mov  esi,DWORD PTR [rbp-0x8]
100003f69 lea  rdi,[rip+0x36]        # 100003fa6 <_main+0x56>
100003f70 mov  al,0x0
100003f72 call 100003f84 <_main+0x34>
100003f77 xor  ecx,ecx
100003f79 mov  DWORD PTR [rbp-0xc],eax
100003f7c mov  eax,ecx
100003f7e add  rsp,0x10
100003f82 pop  rbp
100003f83 ret
-------------------------------------------------------------------------------------
100003f50 push rbp       // rbp 入栈，栈顶下移，rsp 指向新的栈顶
100003f51 mov  rbp,rsp   // rsp = rbp 两者此时都指向新的栈顶 
100003f54 sub  rsp,0x10  // 栈上开辟新的存储空间，即从rbp所指地址到rsp所指地址的内存区域

100003f58 mov  DWORD PTR [rbp-0x4],0x0    // 将 0x0 赋值给 $rbp-0x4
100003f5f mov  DWORD PTR [rbp-0x8],0x3cc  // 将 0x3cc 赋值给 $rbp-0x8

100003f69 lea  rdi,[rip+0x36]        # 100003fa6 <_main+0x56>
/*
leave 指令实现了栈收缩的功能，该指令首先把 rbp 的值赋给 rsp，然后执行出栈操作，把栈顶存储的值赋给 rbp
*/

100003f83 ret
/*
ret 指令从栈中取出返回地址，并且跳转到那里（在函数被调用前，call指令就已经把返回地址入栈）。这就是函数调用的工作原理，它可以确保函数能够正确返回并执行下一条指令。
*/
```

#### 查看内存数据
```
➜ vim memory.c
#include <stdio.h>

int main() {
    int signed_int   = -12345; // 补码为0x‭ffffcfc7‬
    unsigned int unsigned_int = 12345;  // 补码为0x‭3039
	printf("%d %u\n", signed_int, unsigned_int );
    return 0;
}

➜ gcc memory.c -o memory -g

➜ lldb memory
(lldb) target create "memory"
Current executable set to '/Users/james/Desktop/memory' (x86_64).
(lldb) b main
Breakpoint 1: where = memory`main + 15 at memory.c:4:9, address = 0x0000000100003f5f
(lldb) r
Process 9239 launched: '/Users/james/Desktop/memory' (x86_64)
Process 9239 stopped
* thread #1, queue = 'com.apple.main-thread', stop reason = breakpoint 1.1
    frame #0: 0x0000000100003f5f memory`main at memory.c:4:9
   1   	#include <stdio.h>
   2
   3   	int main() {
-> 4   	    int signed_int   = -12345; // 补码为0x‭ffffcfc7‬
   5   	    unsigned int unsigned_int = 12345;  // 补码为0x‭3039
   6   		printf("%d %u\n", signed_int, unsigned_int );
   7   	    return 0;
Target 0: (memory) stopped.
(lldb) dis
memory`main:
    0x100003f50 <+0>:  push   rbp
    0x100003f51 <+1>:  mov    rbp, rsp
    0x100003f54 <+4>:  sub    rsp, 0x10
    0x100003f58 <+8>:  mov    dword ptr [rbp - 0x4], 0x0
->  0x100003f5f <+15>: mov    dword ptr [rbp - 0x8], 0xffffcfc7
    0x100003f66 <+22>: mov    dword ptr [rbp - 0xc], 0x3039
    0x100003f6d <+29>: mov    esi, dword ptr [rbp - 0x8]
    0x100003f70 <+32>: mov    edx, dword ptr [rbp - 0xc]
    0x100003f73 <+35>: lea    rdi, [rip + 0x34]         ; "%d %u\n"
    0x100003f7a <+42>: mov    al, 0x0
    0x100003f7c <+44>: call   0x100003f8e               ; symbol stub for: printf
    0x100003f81 <+49>: xor    ecx, ecx
    0x100003f83 <+51>: mov    dword ptr [rbp - 0x10], eax
    0x100003f86 <+54>: mov    eax, ecx
    0x100003f88 <+56>: add    rsp, 0x10
    0x100003f8c <+60>: pop    rbp
    0x100003f8d <+61>: ret
(lldb) br s -a 0x100003f6d
Breakpoint 2: where = memory`main + 29 at memory.c:6:20, address = 0x0000000100003f6d
(lldb) c
Process 9239 resuming
Process 9239 stopped
* thread #1, queue = 'com.apple.main-thread', stop reason = breakpoint 2.1
    frame #0: 0x0000000100003f6d memory`main at memory.c:6:20
   3   	int main() {
   4   	    int signed_int   = -12345; // 补码为0x‭ffffcfc7‬
   5   	    unsigned int unsigned_int = 12345;  // 补码为0x‭3039
-> 6   		printf("%d %u\n", signed_int, unsigned_int );
   7   	    return 0;
   8   	}
Target 0: (memory) stopped.
(lldb) p &signed_int
(int *) $0 = 0x00007ffeefbff1f8
(lldb) x/8xb 0x00007ffeefbff1f8
0x7ffeefbff1f8: 0xc7 0xcf 0xff 0xff 0x00 0x00 0x00 0x00
(lldb) p &unsigned_int
(unsigned int *) $1 = 0x00007ffeefbff1f4
(lldb) x/8xb 0x00007ffeefbff1f4
0x7ffeefbff1f4: 0x39 0x30 0x00 0x00 0xc7 0xcf 0xff 0xff

```

```
(lldb) x/16x `$rbp`
0x7ffeefbff1a0: 0xefbff1b0 0x00007ffe 0x6846acc9 0x00007fff
0x7ffeefbff1b0: 0x00000000 0x00000000 0x00000001 0x00000000
0x7ffeefbff1c0: 0xefbff478 0x00007ffe 0x00000000 0x00000000
0x7ffeefbff1d0: 0xefbff491 0x00007ffe 0xefbff49f 0x00007ffe
(lldb) x/16x `$rsp`
0x7ffeefbff190: 0xefbff1b0 0x00007ffe 0x00011025 0x00000001
0x7ffeefbff1a0: 0xefbff1b0 0x00007ffe 0x6846acc9 0x00007fff
0x7ffeefbff1b0: 0x00000000 0x00000000 0x00000001 0x00000000
0x7ffeefbff1c0: 0xefbff478 0x00007ffe 0x00000000 0x00000000
```

watchpoint 监控变量读写情况
```
➜ vim watch.c ; gcc watch.c -o watch -g
#include <stdio.h>

int main(int argc, char const *argv[])
{
  int a = 1;
  int b = 2;
  if ( b > 1 )
     a = 3;
  else
     a = 4;
  return 0;
}

➜ lldb watch
(lldb) b main
Breakpoint 1: where = watch`main + 18 at watch.c:5:6, address = 0x0000000100003f82
(lldb) r
diProcess 39066 launched: '/Users/james/Desktop/watch' (x86_64)
diProcess 39066 stopped
* thread #1, queue = 'com.apple.main-thread', stop reason = breakpoint 1.1
    frame #0: 0x0000000100003f82 watch`main(argc=1, argv=0x00007ffeefbff220) at watch.c:5:6
   2
   3    int main(int argc, char const *argv[])
   4    {
-> 5      int a = 1;
   6      int b = 2;
   7
   8      if ( b > 1 )
Target 0: (watch) stopped.
(lldb) watchpoint set variable a
Watchpoint created: Watchpoint 1: addr = 0x7ffeefbff1ec size = 4 state = enabled type = w
    declare @ '/Users/james/Desktop/watch.c:5'
    watchpoint spec = 'a'
    new value: 0
(lldb) s

Watchpoint 1 hit:
old value: 0
new value: 1
Process 39066 stopped
* thread #1, queue = 'com.apple.main-thread', stop reason = watchpoint 1
    frame #0: 0x0000000100003f89 watch`main(argc=1, argv=0x00007ffeefbff220) at watch.c:6:6
   3    int main(int argc, char const *argv[])
   4    {
   5      int a = 1;
-> 6      int b = 2;
   7
   8      if ( b > 1 )
   9         a = 3;
Target 0: (watch) stopped.
(lldb) s
Process 39066 stopped
* thread #1, queue = 'com.apple.main-thread', stop reason = step in
    frame #0: 0x0000000100003f90 watch`main(argc=1, argv=0x00007ffeefbff220) at watch.c:8:8
   5      int a = 1;
   6      int b = 2;
   7
-> 8      if ( b > 1 )
   9         a = 3;
   10     else
   11        a = 4;
Target 0: (watch) stopped.
(lldb) s
Process 39066 stopped
* thread #1, queue = 'com.apple.main-thread', stop reason = step in
    frame #0: 0x0000000100003f9a watch`main(argc=1, argv=0x00007ffeefbff220) at watch.c:9:6
   6      int b = 2;
   7
   8      if ( b > 1 )
-> 9         a = 3;
   10     else
   11        a = 4;
   12     return 0;
Target 0: (watch) stopped.
(lldb) s

Watchpoint 1 hit:
old value: 1
new value: 3
Process 39066 stopped
* thread #1, queue = 'com.apple.main-thread', stop reason = watchpoint 1
    frame #0: 0x0000000100003fa1 watch`main(argc=1, argv=0x00007ffeefbff220) at watch.c:9:4
   6      int b = 2;
   7
   8      if ( b > 1 )
-> 9         a = 3;
   10     else
   11        a = 4;
   12     return 0;
Target 0: (watch) stopped.
```

#### watchpoint 监控内存读写情况
```
➜ vim watch.c ; gcc watch.c -o watch
#include <stdio.h>

int main(int argc, char const *argv[])
{
  int a = 1;
  int b = 2;
  if ( b > 1 )
     a = 3;
  else
     a = 4;
  return 0;
} 

➜ lldb watch
(lldb) target create "watch"
Current executable set to '/Users/james/Desktop/watch' (x86_64).
(lldb) b main
Breakpoint 1: where = watch`main, address = 0x0000000100003f70
(lldb) r
Process 39360 launched: '/Users/james/Desktop/watch' (x86_64)
Process 39360 stopped
* thread #1, queue = 'com.apple.main-thread', stop reason = breakpoint 1.1
    frame #0: 0x0000000100003f70 watch`main
watch`main:
->  0x100003f70 <+0>:  push   rbp
    0x100003f71 <+1>:  mov    rbp, rsp
    0x100003f74 <+4>:  mov    dword ptr [rbp - 0x4], 0x0
    0x100003f7b <+11>: mov    dword ptr [rbp - 0x8], edi
Target 0: (watch) stopped.
(lldb) dis
watch`main:
->  0x100003f70 <+0>:  push   rbp
    0x100003f71 <+1>:  mov    rbp, rsp
    0x100003f74 <+4>:  mov    dword ptr [rbp - 0x4], 0x0
    0x100003f7b <+11>: mov    dword ptr [rbp - 0x8], edi
    0x100003f7e <+14>: mov    qword ptr [rbp - 0x10], rsi
    0x100003f82 <+18>: mov    dword ptr [rbp - 0x14], 0x1
    0x100003f89 <+25>: mov    dword ptr [rbp - 0x18], 0x2
    0x100003f90 <+32>: cmp    dword ptr [rbp - 0x18], 0x1
    0x100003f94 <+36>: jle    0x100003fa6               ; <+54>
    0x100003f9a <+42>: mov    dword ptr [rbp - 0x14], 0x3
    0x100003fa1 <+49>: jmp    0x100003fad               ; <+61>
    0x100003fa6 <+54>: mov    dword ptr [rbp - 0x14], 0x4
    0x100003fad <+61>: xor    eax, eax
    0x100003faf <+63>: pop    rbp
    0x100003fb0 <+64>: ret
(lldb) br s -a 0x100003f89
Breakpoint 2: where = watch`main + 25, address = 0x0000000100003f89
(lldb) c
Process 39360 resuming
Process 39360 stopped
* thread #1, queue = 'com.apple.main-thread', stop reason = breakpoint 2.1
    frame #0: 0x0000000100003f89 watch`main + 25
watch`main:
->  0x100003f89 <+25>: mov    dword ptr [rbp - 0x18], 0x2
    0x100003f90 <+32>: cmp    dword ptr [rbp - 0x18], 0x1
    0x100003f94 <+36>: jle    0x100003fa6               ; <+54>
    0x100003f9a <+42>: mov    dword ptr [rbp - 0x14], 0x3
Target 0: (watch) stopped.
(lldb) dis
watch`main:
    0x100003f70 <+0>:  push   rbp
    0x100003f71 <+1>:  mov    rbp, rsp
    0x100003f74 <+4>:  mov    dword ptr [rbp - 0x4], 0x0
    0x100003f7b <+11>: mov    dword ptr [rbp - 0x8], edi
    0x100003f7e <+14>: mov    qword ptr [rbp - 0x10], rsi
    0x100003f82 <+18>: mov    dword ptr [rbp - 0x14], 0x1
->  0x100003f89 <+25>: mov    dword ptr [rbp - 0x18], 0x2
    0x100003f90 <+32>: cmp    dword ptr [rbp - 0x18], 0x1
    0x100003f94 <+36>: jle    0x100003fa6               ; <+54>
    0x100003f9a <+42>: mov    dword ptr [rbp - 0x14], 0x3
    0x100003fa1 <+49>: jmp    0x100003fad               ; <+61>
    0x100003fa6 <+54>: mov    dword ptr [rbp - 0x14], 0x4
    0x100003fad <+61>: xor    eax, eax
    0x100003faf <+63>: pop    rbp
    0x100003fb0 <+64>: ret
(lldb) x/1w $rbp-0x14
0x7ffeefbff1dc: 0x00000001
(lldb) watchpoint set expression 0x7ffeefbff1dc
Watchpoint created: Watchpoint 1: addr = 0x7ffeefbff1dc size = 8 state = enabled type = w
    new value: -1170951193199902719
(lldb) c
Process 39360 resuming

Watchpoint 1 hit:
old value: -1170951193199902719
new value: -1170951193199902719
Process 39360 stopped
* thread #1, queue = 'com.apple.main-thread', stop reason = watchpoint 1
    frame #0: 0x0000000100003f90 watch`main + 32
watch`main:
->  0x100003f90 <+32>: cmp    dword ptr [rbp - 0x18], 0x1
    0x100003f94 <+36>: jle    0x100003fa6               ; <+54>
    0x100003f9a <+42>: mov    dword ptr [rbp - 0x14], 0x3
    0x100003fa1 <+49>: jmp    0x100003fad               ; <+61>
Target 0: (watch) stopped.
(lldb) c
Process 39360 resuming

Watchpoint 1 hit:
old value: -1170951193199902719
new value: -1170951193199902717
Process 39360 stopped
* thread #1, queue = 'com.apple.main-thread', stop reason = watchpoint 1
    frame #0: 0x0000000100003fa1 watch`main + 49
watch`main:
->  0x100003fa1 <+49>: jmp    0x100003fad               ; <+61>
    0x100003fa6 <+54>: mov    dword ptr [rbp - 0x14], 0x4
    0x100003fad <+61>: xor    eax, eax
    0x100003faf <+63>: pop    rbp
Target 0: (watch) stopped.
(lldb) c
Process 39360 resuming

Watchpoint 1 hit:
old value: -1170951193199902717
new value: 32767
Process 39360 stopped
* thread #1, queue = 'com.apple.main-thread', stop reason = watchpoint 1
    frame #0: 0x00007fff67e8f17c libsystem_c.dylib`_tlv_exit
libsystem_c.dylib`_tlv_exit:
->  0x7fff67e8f17c <+0>: jmp    qword ptr [rip + 0x26679bd6] ; (void *)0x00007fff67dbddea: _tlv_exit

libsystem_c.dylib`abort_with_payload:
    0x7fff67e8f182 <+0>: jmp    qword ptr [rip + 0x26679bd8] ; (void *)0x00007fff67f22408: abort_with_payload

libsystem_c.dylib`access:
    0x7fff67e8f188 <+0>: jmp    qword ptr [rip + 0x26679bda] ; (void *)0x00007fff67f01680: access

libsystem_c.dylib`asl_append:
    0x7fff67e8f18e <+0>: jmp    qword ptr [rip + 0x26679bdc] ; (void *)0x00007fff67e0b911: asl_append
Target 0: (watch) stopped.
(lldb) c
Process 39360 resuming

Watchpoint 1 hit:
old value: 32767
new value: 32767
Process 39360 stopped
* thread #1, queue = 'com.apple.main-thread', stop reason = watchpoint 1
    frame #0: 0x00007fff67e69196 libsystem_c.dylib`__cxa_finalize
libsystem_c.dylib`__cxa_finalize:
->  0x7fff67e69196 <+0>: test   rdi, rdi
    0x7fff67e69199 <+3>: je     0x7fff67e691c5            ; <+47>
    0x7fff67e6919b <+5>: push   rbp
    0x7fff67e6919c <+6>: mov    rbp, rsp
Target 0: (watch) stopped.
```

#### 参考资料
[A Guide to ARM64 / AArch64 Assembly on Linux with Shellcodes and Cryptography](https://modexp.wordpress.com/2018/10/30/arm64-assembly/)
[Siguza/ios-resources](https://github.com/Siguza/ios-resources/blob/master/bits/arm64.md)
[x86-64 函数调用过程中寄存器的使用](https://zhuanlan.zhihu.com/p/25133012)