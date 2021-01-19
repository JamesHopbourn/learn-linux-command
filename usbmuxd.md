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

➜ mkdir -p ~/dotfile/bin

➜ cp USBSSH/* ~/dotfile/bin

➜ echo 'export PATH=$HOME/dotfile/bin:$PATH' >> ~/.zshrc

➜ source ~/.zshrc
```

#### iPhone SSH 端口转发到 macOS 2222 端口
```
➜ tcprelay.py -t 22:2222 &
[1] 79831

➜ ssh root@localhost -p 2222
Incoming connection to 2222
Waiting for devices...
Connecting to device <MuxDevice: ID 25 ProdID 0x1297 Serial '1da41acc0d2a7b49dc2ae82bea47f4c0691e9f4f' Location 0x14100000>
Connection established, relaying data
The authenticity of host '[localhost]:2222 (<no hostip for proxy command>)' can't be established.
RSA key fingerprint is SHA256:M8d0YLjVSbKxl4bqRWHKbPsC22o9vNVASdBhHo55BW8.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added '[localhost]:2222' (RSA) to the list of known hosts.
root@localhost's password:
iPhone:~ root#
```

#### SSH 免密登陆
```
➜ ssh-copy-id root@localhost -p 2222
/usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed
/usr/bin/ssh-copy-id: INFO: 1 key(s) remain to be installed -- if you are prompted now it is to install the new keys
root@localhost's password:

Number of key(s) added: 1

Now try logging into the machine, with:   "ssh -p '2222' 'root@localhost'"
and check to make sure that only the key(s) you wanted were added.

➜ ssh root@localhost -p 2222
iPhone:~ root#
```

#### debugserver 添加权限
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

#### scp via USB
```
➜ scp -P 2222 /Users/james/Desktop/main root@localhost:/var/root/
main                                100%  144KB 219.0KB/s   00:00

➜ scp -P 2222 root@localhost:/var/root/main /Users/james/Desktop/
main                                100%  144KB   3.6MB/s   00:00
```

#### rsync via USB
```
➜ rsync -avzu --progress -e 'ssh -p 2222' usbmuxd-1.0.8.tar.gz root@localhost:/var/root/
Incoming connection to 2222
Waiting for devices...
Connecting to device <MuxDevice: ID 25 ProdID 0x1297 Serial '1da41acc0d2a7b49dc2ae82bea47f4c0691e9f4f' Location 0x14100000>
Connection established, relaying data
building file list ...
1 file to consider
usbmuxd-1.0.8.tar.gz
       70368 100%   17.93MB/s    0:00:00 (xfer#1, to-check=0/1)

sent 70528 bytes  received 42 bytes  141140.00 bytes/sec
total size is 70368  speedup is 1.00
Connection closed

➜ rsync -avzu --progress -e 'ssh -p 2222' Apple-Automation root@localhost:/var/root/
Incoming connection to 2222
Waiting for devices...
Connecting to device <MuxDevice: ID 25 ProdID 0x1297 Serial '1da41acc0d2a7b49dc2ae82bea47f4c0691e9f4f' Location 0x14100000>
Connection established, relaying data
building file list ...
250 files to consider
Apple-Automation/
Apple-Automation/.DS_Store
        6148 100%    0.00kB/s    0:00:00 (xfer#1, to-check=248/250)
Apple-Automation/D.Boring Text Theme.theme
        8940 100%    8.53MB/s    0:00:00 (xfer#2, to-check=247/250)
Apple-Automation/Documents.js
         115 100%   56.15kB/s    0:00:00 (xfer#3, to-check=246/250)
Apple-Automation/LICENSE
       35149 100%    4.79MB/s    0:00:00 (xfer#4, to-check=245/250)
......
```

#### scp debugserver to iOS
```
➜ scp -P 2222 debugserver root@localhost:/usr/bin
debugserver         100%   13MB   2.8MB/s   00:04

➜ ssh root@localhost -p 2222
iPhone:~ root# chmod 777 /usr/bin/debugserver
```

#### debugserver attach SpringBoard
```
iPhone:~ root# debugserver *:1234 -a "SpringBoard"
debugserver-@(#)PROGRAM:debugserver  PROJECT:debugserver-320.2.89 for armv7.
Attaching to process SpringBoard...
Listening to port 1234 for a connection from *...
```

#### macOS 本地端口转发
```
➜ tcprelay.py -t 1234:1234
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
