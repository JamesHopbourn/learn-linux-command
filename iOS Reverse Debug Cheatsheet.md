# iOS Reverse Debug Cheatsheet
## SSH into iOS via usbmuxd
```
🖥 tcprelay.py -t 22:2222 &
🖥 ssh root@localhost -p 2222

wget http://cgit.sukimashita.com/usbmuxd.git/snapshot/usbmuxd-1.0.8.tar.bz2
tar xjfv usbmuxd-1.0.8.tar.bz2
```
### SSH into iOS without password
```
Use "Command + Shift + ." to show hide files
Navigate to ~/.ssh,find "known\_hosts" and delete the line with you iOS device IP
🖥 ssh-keygen -t rsa
🖥 cp ~/.ssh/id_rsa.pub ~/authorized_keys
🖥 tcprelay.py -t 22:2222 &
🖥 ssh root@localhost -p 2222
📱 ssh-keygen
📱 exit
🖥 scp -P 2222 ~/authorized\_keys root@localhost:/var/root/.ssh
🖥 ssh root@localhost -p 2222
```
---

## Decryption
### [dumpdecrypted](https://github.com/stefanesser/dumpdecrypted)
```
📱 ps -e | grep /Applications
📱 DYLD_INSERT_LIBRARIES=/var/root/dumpdecrypted.dylib /path/to/Binary
📱 cycript -p ProcessID
📱NSHomeDirectory()
🖥 scp -P 2222 root@localhost:/path/to/*.decrypted/ ~/Desktop
```
### [clutch](https://github.com/KJCracks/Clutch/releases)
```
📱 clutch -i
📱 clutch -d number
🖥 scp -P 2222 root@localhost:/path/to/*.ipa/ ~/Desktop
```
### LLDB method
```
🖥 tcprelay.py -t 1234:1234 & tcprelay.py -t 22:2222 &
🖥 ssh root@localhost -p 2222
📱 ps -e
🖥 scp -P 2222 root@localhost:/path/to/Binary ~/Desktop
🖥 cd ~/Desktop
🖥 otool -fh Binary **( offset )** 64880640
🖥 otool -arch armv7 -l Binary | grep crypt **( cryptoff & cryptsize )** 16384  54935552
📱 debugserver -x backboard \*:1234 /path/to/Binary
🖥 lldb
🖥 (lldb) process connect connect://localhost:1234
🖥 (lldb) image list Binary **( image offset )**  0x0000000100358000
🖥 (lldb) memory read --force --outfile decrypted.bin --binary --count <**cryptsize**> <**image offset**>+<**cryptoff**>
memory read --force --outfile decrypted.bin --binary --count  54935552 0x0000000100358000+ 64880640
memory read --force --outfile ./decrypted.bin --binary --count 54935552 0x0000000100358000+ 64880640
🖥 (lldb) exit
🖥 dd seek=**seekvalue** bs=1 conv=notrunc if=decrypted.bin of=Binary
**seekvalue**= **offset** from “otool -fh” + **cryptoff** from “otool -arch armv7 -l”
**Use Mach-O to set cryptid as 00000000**
```
## Check LC_ENCRYPTION_INFO
```
🖥 otool -l Binary | grep cryptid 查看是否加密
🖥 lipo -info Binary 查看构架信息
🖥 lipo -create Binary_armv7 Binary_arm64 -o Binary 合并构架
🖥 lipo Binary -thin armv7 -o Binary_armv7 构架拆分
🖥 lipo Binary -thin arm64 -o Binary_arm64 构架拆分

extract 抽取某一构架
remove 删除某一构架
thin 直接进行瘦身
```
## [class-dump](https://github.com/nygard/class-dump)
```
🖥 class-dump  --list Binary
🖥 class-dump -S -s -H -arch armv7 Binary -o ~/Desktop/Binary
🖥 class-dump -f keyword Binary
```

## LLDB + debugserver debug
Use "Command + Shift + ." to show hide files  
Navigate to ~/,find ".lldbinit" edit it and paste below commands  
```
	settings set target.x86-disassembly-flavor intel
	settings set target.max-memory-read-size 0x1000
	command alias bp breakpoint set -a %1
	command alias bl breakpoint list
	command alias rtc breakpoint set -o -a %1
	command alias pof expression -OAv -- %1
	command alias pcc process connect connect://localhost:1234
	command alias fo target modules lookup -a %1
```

### [chisel](https://github.com/facebook/chisel)
```
brew install chisel
brew info chisel **( Chisel Version )**
echo command script import /usr/local/Cellar/chisel/**Chisel Version**/libexec/fblldb.py  >> ~/.lldbinit
**Relaunch Xcode **

🖥 ssh root@localhost -p 2222
📱 ps -e | grep Application
📱 debugserver -a \*:1234 “SpringBoard”
📱 debugserver -x backboard \*:1234 /path/to/Binary
🖥 tcprelay.py -t 1234:1234 &
🖥 lldb
🖥 (lldb) pcc
🖥 (lldb) image list Binary
```
### Base commands
```
c 
n
s
expr
frame info
thread return
process attach --pid 1234 ( OS X )
process attach --name QQ ( OS X )
```
### register
```
register write r0 0
register write r0 1
```
### threads info
```
bt (backtrace)
bt all (all threads)
```
### breakpoint = br = b
```
br en
br en 1
br dis
br dis 1
br ptrace
br com add 1
b 0x0023234f
br s -a 0x0023234f 
br s -a 0xb446+0x9a000
br s -F "-[NSArray objectAtIndex:]"
```
### po
|              armv7                |             arm64                 |
|:---------------------------------:|:---------------------------------:|
| p/x $lr                           | p/x $lr                           |
| po $r0                            | po $x0                            |
| po (char\*)$r1                    | po (char\*)$x1                    |
| po (SEL)$r1                       | po (SEL)$x1                       |
| po [$r0 class]                    | po [$x0 class]                    |
| po [$r0 target]                   | po [$x0 target]                   |
| po [$r0 action]                   | po [$x0 action]                   |
| po [$r0 subviews]                 | po [$x0 subviews]                 |
| po [$r0 detailTextLable]          | po [$x0 detailTextLable]          |
| po [[$r0 object] messagecount]    | po [[$x0 object] messagecount]    |
| po [$r0 propertyForKey:@"set"]    | po [$x0 propertyForKey:@"set"]    |
| po [$r0 propertyForKey:@"get"]    | po [$x0 propertyForKey:@"get"]    |
```
po [0x14e2d1c00 nextResponder]
po [NSObject _ivarDescription]
po [NSObject _shortMethodDescription]
po [NSObject _methodDescriptionForClass:]
po [UIApp keyWindow recursiveDescription]
po [[[UIWindow keyWindow] rootViewController] _printHierarchy]
po NSStringFromSelector (0x0000000107e5deae)
Reference *iOS App Reverse Engineering Second Edition* Page 102
```
### chisel
```
(lldb) pvc
(lldb) fv scrollView
(lldb) fvc Keyword
(lldb) pviews
(lldb) hide 0x7f8fa6134df0
(lldb) show 0x7f8fa6134df0
(lldb) pviews 0x7f8fa6134df0
(lldb) pinternals 0x7f999bde0ba0
(lldb) presponder 0x7f999bde0ba0
(lldb) wivar 0x7f999bde0ba0 \_subviews
(lldb) bmessage -[NSViewController viewDidLoad]
```

## Find Target Method
### LLDB Example ( OS X )
```
(lldb) process attach -name QQ
(lldb) pviews
(lldb) po 0x7fc201094360
<TXHoverButton: 0x7fc201094360>
(lldb) po [0x7fc201094360 target]
<AppMoreViewController: 0x7fc1fffae3c0>
(lldb) po [0x7fc201094360 action]
0x0000000107e5deae
(lldb) po NSStringFromSelector(0x0000000107e5deae)
didClickSetting:
```
**-[TXHoverButton didClickSetting:]**


### [cycript](http://cycript.org) ( iOS )
```
Load script ：cycript -p WeChat common.cy ; cycript -p WeChat
```
#### Find View
```
[UIApp windows].toString()
[UIApp keyWindow].toString()
[[UIApp keyWindow] _autolayoutTrace].toString()
[[UIWindow keyWindow] recursiveDescription].toString()
[[UIWindow keyWindow] rootViewController] _printHierarchy].toString() ** iOS 8+**
[[UIApp->_uiController.window recursiveDescription] writeToFile:"/var/mobile/viewdump.txt" atomically:NO encoding:4 error:NULL

[choose(SBApplicationController)[0] _methodDescription].toString()

rootcontroller = [[UIApplication sharedApplication ] keyWindow ].rootViewController 
rootcontroller.viewControllers
\#0x15da32200.view.subviews() 
_inputtoolview=#0x18ff88b0
_inputtoolview.subviews()
[_inputtoolview resalStartRecording]

choose(UITableView)
tabView = # 0x14798410

[\#0x14798410 subviews]
[\#0x14798410 superview]
[\#0x1457f95b0 delegate]
[\#0x1457f95b0 **Method**]
[\#0x1457f95b0 nextResponder]
[\#0x1457f95b0 setHidden:NO]
[\#0x1457f95b0 setHidden:YES]
[\#0x1457f95b0 setText:@"ok"]
[\#0x1457f95b0 setTitle:@"Test"]
```

#### Find Method
```
James-Hopbournde-iPhone:~ root# ps -e | grep WeChat
  874 ??         0:04.66 /var/mobile/Applications/C1F60A76-2205-453F-8B8B-D7E8DF305314/WeChat.app/WeChat
  876 ttys000    0:00.02 grep WeChat
James-Hopbournde-iPhone:~ root# cycript -p 874
cy# [UIApp keyWindow].toString()
<iConsoleWindow: 0x167a2980; baseClass = UIWindow; frame = (0 0; 320 480); gestureRecognizers = <NSArray: 0x167a3080>; layer = <UIWindowLayer: 0x167a2bd0>>"
cy# [[UIWindow keyWindow] recursiveDescription].toString()
<iConsoleWindow: 0x167a2980; baseClass = UIWindow; frame = (0 0; 320 480); gestureRecognizers = <NSArray: 0x167a3080>; layer = <UIWindowLayer: 0x167a2bd0>>
   | <UIView: 0x17143420; frame = (0 0; 320 480); autoresize = W+H; layer = <CALayer: 0x17143480>>
   |    | <MMTableView: 0x16bc5a00; baseClass = UITableView; frame = (0 0; 320 480); clipsToBounds = YES; autoresize = W+H; gestureRecognizers = <NSArray: 0x171426e0>; layer = <CALayer: 0x17142c50>; contentOffset: {0, 0}>
   |    |    | <UITableViewWrapperView: 0x17141e60; frame = (0 0; 320 480); autoresize = W+H; layer = <CALayer: 0x17141d60>>
   |    |    | <UIView: 0x17105140; frame = (0 0; 320 288); layer = <CALayer: 0x17105e40>>
   |    |    |    | <UIView: 0x171110e0; frame = (0 0; 320 288); autoresize = LM+RM; layer = <CALayer: 0x17111140>>
   |    |    |    |    | <UIImageView: 0x17111170; frame = (120 64; 80 80); clipsToBounds = YES; opaque = NO; autoresize = LM+RM; userInteractionEnabled = NO; layer = <CALayer: 0x171111f0>>
   |    |    |    |    | <MMUILabel: 0x1714fdc0; baseClass = UILabel; frame = (113 159; 93 19); text = '131XXXXXXXX'; autoresize = LM+RM; userInteractionEnabled = NO; layer = <CALayer: 0x17159170>>
   |    |    |    |    | <FixTitleColorButton: 0x1714bde0; baseClass = UIButton; frame = (20 198; 280 47); clipsToBounds = YES; opaque = NO; autoresize = LM+RM; layer = <CALayer: 0x165e5ae0>>
   |    |    |    |    |    | <UIButtonLabel: 0x17110c40; frame = (95 12; 90 22); text = '\u58f0\u97f3\u9501\u767b\u5f55'; clipsToBounds = YES; opaque = NO; userInteractionEnabled = NO; layer = <CALayer: 0x17193d30>>
   |    |    |    |    |    | <UIImageView: 0x1714d080; frame = (55 8.5; 30 30); opaque = NO; userInteractionEnabled = NO; layer = <CALayer: 0x170ded30>>
   |    |    |    |    | <UIButton: 0x1710c900; frame = (134 265; 52 18); opaque = NO; autoresize = LM; layer = <CALayer: 0x1710c8d0>>
   |    |    |    |    |    | <UIButtonLabel: 0x1710c7a0; frame = (0 1; 52 16); text = '\u5bc6\u7801\u767b\u5f55'; clipsToBounds = YES; opaque = NO;
cy# [#0x1714bde0 setHidden:YES]
cy# [#0x1714bde0 setHidden:NO]
cy# button = #0x1714bde0
#"<FixTitleColorButton: 0x1714bde0; baseClass = UIButton; frame = (20 198; 280 47); clipsToBounds = YES; opaque = NO; autoresize = LM+RM; layer = <CALayer: 0x165e5ae0>>"
cy# [button allTargets]
[NSSet setWithArray:@[#"<WCAccountLoginControlLogic: 0x17149da0>"]]]
cy# target = #0x17149da0
#"<WCAccountLoginControlLogic: 0x17149da0>"
cy# [button allControlEvents]
64
cy# [button actionsForTarget:target forControlEvent:64]
@["onLastUserVoicePrintLogin:"]
```

#### ASCII
```
python
s=b'\\xe8\\xbe\\x93\\xe5\\x85\\xa5\\xe9\\xaa\\x8c\\xe8\\xaf\\x81\\xe7\\xa0\\x81'
print s

s=u'\u8bf7\u8f93\u5165\u9a8c\u8bc1\u7801'
print s
```

#### Bundle ID
```
[UIApp displayIdentifier]
```
#### Documents Path
```
NSHomeDirectory()
```
#### Other
```
var alert = [[UIAlertView alloc] initWithTitle:@"Title" message:@"Cycript" delegate:nil cancelButtonTitle:@"cancel" otherButtonTitles:nil]

var shot = [SBScreenShotter sharedInstance]
[shot saveScreenshot:YES]
```
#### URL
```
var application = [UIApplication sharedApplication];
[application openURL:[NSURL URLWithString:@"https://google.com"]];
```
Reference *iOS App Reverse Engineering Second Edition* Page 167

对于armv7和armv7s来说，函数的前4个参数存放在R0到R3中，其他参数存放在栈中；返回值放在R0中。对于arm64来说，函数的参数存放在X0到Xn中，返回值放在X0中。

对于armv7和armv7s来说 函数的前三个参数放在R0和R3中，其他的函数放在栈中；返回值放R0中。对于arm64来说，函数的参数放在X0到Xn中，返回值放在X0中

## [socat](http://www.dest-unreach.org/socat/doc/socat.html)
```
apt-get install socat nano
nano /usr/bin/log
	socat - UNIX-CONNECT:/var/run/lockdown/syslog.sock
chmod +x /usr/bin/log
log
\> watch
```

## codesign
### 准备工作
```
查看可用的签名账户：security find-identity -v -p codesigning

导出封包的授权文件：security cms -D -i embedded.mobileprovision > mobileprovision.plist

/usr/libexec/PlistBuddy -x -c 'Print :Entitlements' mobileprovision.plist > entitlements.plist
```

### 包内工作
```
更改唯一标识符：/usr/libexec/PlistBuddy -c "Set :CFBundleIdentifier com.xxx.xxx" Payload/xxx.app/Info.plist
删除 _CodeSignature 文件夹

对注入动态库签名：codesign -f -s  "" xxx.dylib
对库文件进行签名：codesign -f -s "" --entitlements entitlements.plist XXX.app/Frameworks/*.framework
```

### 封包安装
```
对已经签名进行封包：codesign -f -s  --entitlements entitlements.plist Due.app
验证文件签名有效性：codesign -v Example.app
查看签名信息：codesign -vv -d Example.app
```


## Code Injection
### otool
```
otool -l Binary
otool -L Binary 检查依赖项
otool -arch arm64 -L Binary
otool -fh Binary
```
### 更改动态库加载路径 install_name_tool
```
install_name_tool -change /usr/lib/libsubstrate.dylib @loader_path/libsubstrate.dylib Example.dylib
install_name_tool -change /usr/lib/libsubstrate.dylib @executable_path/libsubstrate.dylib Example.dylib
```
### 可执行文件注入动态库
### [yololib](https://github.com/KJCracks/yololib)
```
yololib Binary Example.dylib
```
### [insert_dylib](https://github.com/Tyilo/insert_dylib)
```
insert_dylib @executable_path/Example.dylib Binary [New_Binary]
```
### [optool](https://github.com/alexzielenski/optool)
```
optool -b Binary
optool install -c load -p “@executable_path/Example.dylib” -t /Binary.app/Binary
optool uninstall -p “@executable\_path/Example.dylib” -t /Binary.app/Binary
optool install -c restore -t Binary
```

### libimobiledevice
#### Install：
```
brew cask install osxfuse
brew install libimobiledevice ideviceinstaller ifuse
```
##### System log
```
idevicesyslog
```
##### Install app
```
ideviceinstaller -i Name.ipa
```
##### Uninstall app
```
ideviceinstaller -U [BundleID]
```
##### Device UUID
```
idevice_id –list
```
##### ScreenShot
```
idevicescreenshot
```
##### Device Info
```
ideviceinfo
```
##### Device name
```
idevicename
```
##### Check provision files
```
ideviceprovision list
```
##### List Store App's BuneleID
```
ideviceinstaller -l
```
##### Load App's Documents folder
```
ifuse –documents [BundleID]
```
##### Load system files
```
sudo mkdir /opt/Mount
chmod +x /opt/Mount
ifuse –root /opt/Mount
```
##### Unload system files
```
diskutil unmount /opt/Mount
```
##### Shutdown/Restart/Sleep
```
idevicediagnostics shutdown/restart/sleep
```
##### Backup
```
idevicebackup2 -u [UUID] backup ~/Desktop
##### Enter recover mode
ideviceenterrecovery
```
## Other commands
### ps
```
ps -e
ps -e | gerp /Applications 
```
### Theos
```
make DEBUG=0 package
```
### zip
```
zip Example.zip File
zip -r Example.zip File1 File2
unzip Example.ipa
```
### tar
```
tar -cf Example.tar File
tar -xf Example.tar
```
### nm
```
nm -g Binary
```
### killall
```
killall -9 ProcessName
killall -p PID
```
### Bundle ID
```
clutch -i
```
### [ldid](http://joedj.net/ldid)
```
ldid -e Binary \>\> Binary.xml
ldid -S[ent.xml](http://7xibfi.com1.z0.glb.clouddn.com/uploads/default/668/c134605bb19a433f.xml) debugserver
```
### launchctl
```
launchctl load /Library/LaunchDaemons/xxx.plist
launchctl unload /Library/LaunchDaemons/xxx.plist
```
### [keychain\_dumper](https://github.com/ptoomey3/Keychain-Dumper)
```
keychain\_dumper \>/var/root/password
```
### [unsign](https://github.com/steakknife/unsign)
```
unsign Binary
```
### logify.pl
```
logify.pl AAA.h \>Tweak.xm
logify.pl AAA.h BBB.h \>\>Tweak.xm
```
### defaults
```
defaults write www.whispering.co Author leslie
defaults read www.whispering.co Author
defaults write com.apple.finder FXShowPosixPathInTitle -bool YES
defaults delete CFBundleResourceSpe Info.plist
```
### [restore-symbol](https://github.com/tobefuturer/restore-symbol)
```
restore-symbol Binary -o ~/Desktop/BinaryRestore
### [dyld_decache](https://github.com/kennytm/Miscellaneous)
dyld_decache\[v0.1c\] -o ~/Desktop/binarys dyld_shared_cache_armv7
```
### plutil
```
plutil -p example.plist
plutil -convert json Example.plist
plutil -insert Agree -bool "Yes" example.plist
plutil -insert LastName -string "Liu" example.plist
```
### idevicesyslog
```
brew install libimobiledevice
brew install -v --HEAD   --fresh  --build-from-source libimobiledevice 
sudo chmod 777 /var/db/lockdown
idevicesyslog | grep 'Keyword' --color  -A  10  -B  10
```
### respring
```
vim /usr/bin/respring
	killall -9 SpringBoard
chmod +x /usr/bin/respring
respring
```
### sha
```
shasum ExampleFile
```
### uicache
```
su -c mobile uicache
```
### grep
```
grep Keyword TargetFile
grep -r Keyword TargetFolder
```
### extract
```
ar -x Example.deb
tar -xf data.lama
```
### file
```
file ExampleFile
```
### stings
```
strings /path/to/excutable | grep keyword
```
#### And…
```
cd history wget curl su sudo brew apt-get ssh scp mv cp rm mkdir ls nano chmod pwd python touch cat git echo clear reboot exit  brew_cask clang dpkg dpkg-deb tcpdump xcode-select sysctl shasum
sudo plutil -convert xml1 /System/Library/CoreServices/Finder.app/Contents/Resources/English.lproj/InfoPlist.strings
```