#### SDK path
```
➜ xcrun --sdk iphoneos --show-sdk-path
/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS14.3.sdk
```

### build for iOS
```
➜ cat main.m
#include <stdio.h>

int main(int argc, char const *argv[])
{
	printf("%d, %d, %d, %d, %d\n",1,2,3,4,5);
	return 6;
}

➜ xcrun -sdk iphoneos clang -arch armv7 -arch arm64 main.m -o main

➜ file main
main: Mach-O universal binary with 2 architectures: [arm_v7:Mach-O executable arm_v7] [arm64:Mach-O 64-bit executable arm64]
main (for architecture armv7):	Mach-O executable arm_v7
main (for architecture arm64):	Mach-O 64-bit executable arm64
```