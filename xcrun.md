#### SDK path
```
➜ xcrun --sdk iphoneos --show-sdk-path
/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS14.3.sdk
```

### build for iOS
```
➜ cat main.m
#include <stdio.h>

int main(int argc, char const *argv[]){
	printf("%d, %d, %d, %d, %d\n",1,2,3,4,5);
	return 6;
}
```
```
➜ xcrun -sdk iphoneos clang -arch armv7 -arch arm64 main.m -o main
```
```
➜ file main
main: Mach-O universal binary with 2 architectures: [arm_v7:Mach-O executable arm_v7] [arm64:Mach-O 64-bit executable arm64]
main (for architecture armv7):	Mach-O executable arm_v7
main (for architecture arm64):	Mach-O 64-bit executable arm64
```
```
➜ objdump -d -j .text main|awk '{ print $1" " substr($0, index($0,$3))}'
In main:
 
armv5te: format mach-o-arm
 
 
Disassembly section .text:
 
0000bf70 0000bf70 <_main>:
bf70: push	{r7, lr}
bf72: mov	r7, sp
bf74: sub	sp, #24
bf76: movs	r2, #0
bf78: str	r2, [sp, #20]
bf7a: str	r0, [sp, #16]
bf7c: str	r1, [sp, #12]
bf7e: 0062 	movw	r0, #98	; 0x62
bf82: 0000 	movt	r0, #0
bf86: add	r0, pc
bf88: movs	r1, #1
bf8a: movs	r2, #2
bf8c: movs	r3, #3
bf8e: 0904 	movw	r9, #4
bf92: 9000 	str.w	r9, [sp]
bf96: 0905 	movw	r9, #5
bf9a: 9004 	str.w	r9, [sp, #4]
bf9e: e806 	blx	bfac <_main+0x3c>
bfa2: movs	r1, #6
bfa4: str	r0, [sp, #8]
bfa6: mov	r0, r1
bfa8: add	sp, #24
bfaa: pop	{r7, pc}
 
aarch64: format mach-o-arm64
 
 
Disassembly section .text:
 
0000000100007f10 0000000100007f10 <_main>:
100007f10: sub	sp, sp, #0x50
100007f14: stp	x29, x30, [sp, #64]
100007f18: add	x29, sp, #0x40
100007f1c: stur	wzr, [x29, #-4]
100007f20: stur	w0, [x29, #-8]
100007f24: stur	x1, [x29, #-16]
100007f28: adrp	x0, 100007000 <__mh_execute_header+0x7000>
100007f2c: add	x0, x0, #0xfa4
100007f30: mov	x8, sp
100007f34: mov	x9, #0x1                   	// #1
100007f38: str	x9, [x8]
100007f3c: mov	x9, #0x2                   	// #2
100007f40: str	x9, [x8, #8]
100007f44: mov	x9, #0x3                   	// #3
100007f48: str	x9, [x8, #16]
100007f4c: mov	x9, #0x4                   	// #4
100007f50: str	x9, [x8, #24]
100007f54: mov	x9, #0x5                   	// #5
100007f58: str	x9, [x8, #32]
100007f5c: bl	100007f74 <_main+0x64>
100007f60: mov	w10, #0x6                   	// #6
100007f64: mov	x0, x10
100007f68: ldp	x29, x30, [sp, #64]
100007f6c: add	sp, sp, #0x50
100007f70: ret
```