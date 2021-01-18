#### 下载 usbmuxd
```
➜ wget 'https://cdn.iosre.com/uploads/default/original/2X/a/aa9cecf05b47d08a59324edeaaeea3f17e0608ee.zip'
--2021-01-18 20:55:43--  https://cdn.iosre.com/uploads/default/original/2X/a/aa9cecf05b47d08a59324edeaaeea3f17e0608ee.zip
Resolving cdn.iosre.com (cdn.iosre.com)... 36.156.81.226
Connecting to cdn.iosre.com (cdn.iosre.com)|36.156.81.226|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 9522 (9.3K) [application/zip] 
Saving to: ‘aa9cecf05b47d08a59324edeaaeea3f17e0608ee.zip’

aa9cecf05b47d08a593 100%[==================>]   9.30K  --.-KB/s    in 0s

2021-01-18 20:55:44 (63.5 MB/s) - ‘aa9cecf05b47d08a59324edeaaeea3f17e0608ee.zip’ saved [9522/9522]

➜ unzip aa9cecf05b47d08a59324edeaaeea3f17e0608ee.zip
Archive:  aa9cecf05b47d08a59324edeaaeea3f17e0608ee.zip
   creating: USBSSH/
  inflating: USBSSH/.gitignore
  inflating: USBSSH/command.vim
  inflating: USBSSH/tcprelay.py
  inflating: USBSSH/usbmux.py
  inflating: USBSSH/usbmux.pyc
```

#### iPhone SSH 端口转发到 macOS 2222 端口
```
➜ ./USBSSH/tcprelay.py -t 22:2222
Forwarding local port 2222 to remote port 22

➜ ssh root@localhost -p 2222
The authenticity of host '[localhost]:2222 ([127.0.0.1]:2222)' can't be established.
RSA key fingerprint is SHA256:M8d0YLjVSbKxl4bqRWHKbPsC22o9vNVASdBhHo55BW8.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added '[localhost]:2222' (RSA) to the list of known hosts.
jamesde-iPhone:~ root#
```

#### debugserver添加权限
```
➜ cd /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/DeviceSupport/9.0

➜ open DeveloperDiskImage.dmg

➜ file /Volumes/DeveloperDiskImage/usr/bin/debugserver
/Volumes/DeveloperDiskImage/usr/bin/debugserver: Mach-O universal binary with 3 architectures: [arm_v7:Mach-O executable arm_v7] [arm_v7s] [arm64]
/Volumes/DeveloperDiskImage/usr/bin/debugserver (for architecture armv7): Mach-O executable arm_v7
/Volumes/DeveloperDiskImage/usr/bin/debugserver (for architecture armv7s):  Mach-O executable arm_v7s
/Volumes/DeveloperDiskImage/usr/bin/debugserver (for architecture arm64): Mach-O 64-bit executable arm64
➜ cp /Volumes/DeveloperDiskImage/usr/bin/debugserver ~/Desktop

➜ vim entitlement.plist
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/ PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
<key>com.apple.springboard.debugapplications</key>
<true/>
<key>run-unsigned-code</key>
<true/>
<key>get-task-allow</key>
<true/>
<key>task_for_pid-allow</key>
<true/>
</dict>
</plist>

➜ codesign -s - --entitlements entitlement.plist -f debugserver
debugserver: replacing existing signature
```

#### 拷贝 debugserver 给 iOS
```
➜ scp -P 2222 debugserver root@localhost:/usr/bin
debugserver         100%   13MB   2.8MB/s   00:04

➜ ssh root@localhost -p 2222
jamesde-iPhone:~ root# chmod 777 /usr/bin/debugserver
```

#### debugserver attach SpringBoard
```
jamesde-iPhone:~ root# debugserver *:1234 -a "SpringBoard"
debugserver-@(#)PROGRAM:debugserver  PROJECT:debugserver-320.2.89 for armv7.
Attaching to process SpringBoard...
Listening to port 1234 for a connection from *...
```

#### macOS 本地端口转发
```
➜ ./USBSSH/tcprelay.py -t 1234:1234
Forwarding local port 1234 to remote port 1234
```

#### 连接本地转发的端口
```
➜ lldb
(lldb) process connect connect://localhost:1234
Process 29 stopped
* thread #1, queue = 'com.apple.main-thread', stop reason = signal SIGSTOP
    frame #0: 0x3a5d9a58 libsystem_kernel.dylib`___lldb_unnamed_symbol19$$libsystem_kernel.dylib + 22
libsystem_kernel.dylib`___lldb_unnamed_symbol19$$libsystem_kernel.dylib:
->  0x3a5d9a58 <+22>: lsls   r0, r6, #0x5
    0x3a5d9a5a <+24>: .long  0xff1ee8bd                ; unknown opcode

libsystem_kernel.dylib`___lldb_unnamed_symbol20$$libsystem_kernel.dylib:
    0x3a5d9a5e <+0>:  b      0x3a5d9cc0                ; ___lldb_unnamed_symbol53$$libsystem_kernel.dylib + 2
    0x3a5d9a60 <+2>:  stm    r0!, {r0, r2, r3}
(lldb) c
Process 29 resuming
(lldb)
```