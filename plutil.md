#### 打印 plist 内容
```
➜ plutil -p com.apple.dock.plist
{
  "autohide" => 1
  "last-messagetrace-stamp" => 624858776.484993
  "loc" => "zh_CN:CN"
  "mod-count" => 4120
  "orientation" => "left"
  "persistent-apps" => [
    0 => {
      "GUID" => 4010545205
      "tile-data" => {
        "book" => {length = 548, bytes = 0x626f6f6b 24020000 00000410 30000000 ... 04000000 00000000 }
        "bundle-identifier" => "com.apple.Safari"
        "dock-extra" => 0
        "file-data" => {
          "_CFURLString" => "file:///Applications/Safari.app/"
          "_CFURLStringType" => 15
        }
        "file-label" => "Safari浏览器"
        "file-mod-date" => 213502210964487
        "file-type" => 41
        "parent-mod-date" => 232687834048158
      }
      "tile-type" => "file-tile"
    }
    1 => {
      "GUID" => 818494866
      "tile-data" => {
        "book" => {length = 600, bytes = 0x626f6f6b 58020000 00000410 30000000 ... 04000000 00000000 }
        "bundle-identifier" => "com.apple.systempreferences"
        "dock-extra" => 1
        "file-data" => {
          "_CFURLString" => "file:///System/Applications/System%20Preferences.app/"
          "_CFURLStringType" => 15
        }
        "file-label" => "系统偏好设置"
        "file-mod-date" => 212986814888967
        "file-type" => 41
        "parent-mod-date" => 3673467070
      }
      "tile-type" => "file-tile"
    }
  ]
  "persistent-others" => [
    0 => {
      "GUID" => 4010545219
      "tile-data" => {
        "arrangement" => 2
        "book" => {length = 648, bytes = 0x626f6f6b 88020000 00000410 30000000 ... 04000000 00000000 }
        "displayas" => 0
        "file-data" => {
          "_CFURLString" => "file:///Users/james/Downloads/"
          "_CFURLStringType" => 15
        }
        "file-label" => "下载"
        "file-mod-date" => 51904059717121
        "file-type" => 2
        "parent-mod-date" => 212888023909367
        "preferreditemsize" => -1
        "showas" => 1
      }
      "tile-type" => "directory-tile"
    }
  ]
  "recent-apps" => [
    0 => {
      "GUID" => 3155562949
      "tile-data" => {
        "book" => {length = 548, bytes = 0x626f6f6b 24020000 00000410 30000000 ... 04000000 00000000 }
        "bundle-identifier" => "com.googlecode.iterm2"
        "dock-extra" => 0
        "file-data" => {
          "_CFURLString" => "file:///Applications/iTerm.app/"
          "_CFURLStringType" => 15
        }
        "file-label" => "iTerm"
        "file-mod-date" => 3656828546
        "file-type" => 1
        "parent-mod-date" => 205904418251524
      }
      "tile-type" => "file-tile"
    }
    1 => {
      "GUID" => 3155562950
      "tile-data" => {
        "book" => {length = 552, bytes = 0x626f6f6b 28020000 00000410 30000000 ... 04000000 00000000 }
        "bundle-identifier" => "com.omnigroup.OmniFocus2"
        "dock-extra" => 0
        "file-data" => {
          "_CFURLString" => "file:///Applications/OmniFocus.app/"
          "_CFURLStringType" => 15
        }
        "file-label" => "OmniFocus"
        "file-mod-date" => 3615207793
        "file-type" => 1
        "parent-mod-date" => 205904418251524
      }
      "tile-type" => "file-tile"
    }
    2 => {
      "GUID" => 3155562951
      "tile-data" => {
        "book" => {length = 548, bytes = 0x626f6f6b 24020000 00000410 30000000 ... 04000000 00000000 }
        "bundle-identifier" => "com.tencent.xinWeChat"
        "dock-extra" => 0
        "file-data" => {
          "_CFURLString" => "file:///Applications/WeChat.app/"
          "_CFURLStringType" => 15
        }
        "file-label" => "微信"
        "file-mod-date" => 27220892388992
        "file-type" => 1
        "parent-mod-date" => 205904418251524
      }
      "tile-type" => "file-tile"
    }
  ]
  "region" => "CN"
  "springboard-columns" => 6
  "springboard-rows" => 6
  "tilesize" => 52
  "trash-full" => 1
  "version" => 1
  "wvous-tr-corner" => 5
  "wvous-tr-modifier" => 0
}
```
#### 语法错误检测
```
plutil -lint /path/to/name.plist
```
#### 两种修改数据方法
```
如果 plist 文件存放在 Preferences 目录可以不带 .plist
defaults read-type com.apple.dock autohide

如果 plist 文件不存在 Preferences 目录一定要带 .plist
defaults read-type com.apple.dock.plist autohide
```
#### 修改布尔型数据
```
➜ defaults read-type com.apple.dock.plist autohide
Type is boolean

➜ defaults write com.apple.dock.plist autohide -bool YES
```
#### 修改字符型数据
```
➜ defaults read-type com.apple.dock orientation
Type is string

➜ defaults write com.apple.dock orientation -string right

➜ killall Dock
```
#### 修改整型数据
```
➜ defaults read-type com.apple.dock springboard-columns
Type is integer

➜ defaults write com.apple.dock springboard-columns -integer 6

➜ defaults write com.apple.dock springboard-rows -integer 6

➜ killall Dock
```
#### 文件类型转换
```
➜ plutil -convert xml1 com.apple.dock.plist

➜ (head && tail ) < com.apple.dock.plist
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>autohide</key>
	<true/>
	<key>last-messagetrace-stamp</key>
	<real>624858776.48499298</real>
	<key>loc</key>
	<string>zh_CN:CN</string>
	<key>trash-full</key>
	<true/>
	<key>version</key>
	<integer>1</integer>
	<key>wvous-tr-corner</key>
	<integer>5</integer>
	<key>wvous-tr-modifier</key>
	<integer>0</integer>
</dict>
</plist>

➜ file com.apple.dock.plist
com.apple.dock.plist: XML 1.0 document text, UTF-8 Unicode text

➜ plutil -convert binary1 com.apple.dock.plist

➜ file com.apple.dock.plist
com.apple.dock.plist: Apple binary property list
```

#### 参考资料
[Editing Property Lists with plutil](https://scriptingosx.com/2016/11/editing-property-lists/)
[defaults – the Plist Killer](https://scriptingosx.com/2018/02/defaults-the-plist-killer/)