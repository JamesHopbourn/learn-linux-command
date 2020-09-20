## 相关文件准备
#### embedded.mobileprovision
新建 Xcode 工程运行在真机上后提取

#### entitlements.plist
```
security cms -D -i embedded.mobileprovision > mobileprovision.plist
/usr/libexec/PlistBuddy -x -c 'Print :Entitlements' mobileprovision.plist > entitlements.plist
```



## 软件修改

#### 修改标识符
```
/usr/libexec/PlistBuddy -c "Set :CFBundleIdentifier Xcode 新建工程的 Bundle ID" Info.plist
```

#### 删除多余文件夹或者一并重签名
```
rm -rf  Watch
rm -rf  PlugIns
rm -rf  _CodeSignature
```

#### 导入签名文件
```
cp ~/Desktop/embedded.mobileprovision ./
```

#### 检查依赖项
```
otool -L binary
```

#### 修改加载地址
```
install_name_tool -change /Library/Frameworks/CydiaSubstrate.framework/CydiaSubstrate @executable_path/libsubstrate.dylib example.dylib
```

#### 注入动态库
```
yololib Binary example.dylib
insert_dylib @executable_path/example.dylib Binary [New_Binary]
optool install -c load -p "@executable_path/example.dylib" -t /example.app/example
```

## 软件目录外部签名软件
#### 获取帐号 ID

```
"ID"：security find-identity -v -p codesigning
```

#### 重签库文件夹

```
codesign -f -s "ID" --entitlements entitlements.plist example.app/Frameworks/*.framework
```
#### 获取开发者账号 ID
```
security find-identity -v -p codesigning
```

#### 重签动态库文件
```
codesign -f -s "ID" example.app/*.dylib 
```

#### 软件封包签名
```
codesign -f -s "ID" --entitlements entitlements.plist example.app
```



## 安装运行软件

#### 验证签名有效性
```
codesign -v example.app
```

#### 查看签名信息
```
codesign -vv -d example.app
```

#### 安装软件
```
ideviceinstaller -i example.app
```