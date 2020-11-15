#### zip 炸弹
```
dd if=/dev/zero count=$((1024*1024)) bs=10240 of=bigFile.csv
zip -9 bigFile.zip bigFile.csv
```

#### 不含 MACOS 的压缩包
```
zip -r compressed.zip /path/to/dir

7z a -tzip compressed.zip /path/to/dir
```

#### 图片藏压缩包
```
zip output.zip test.mp3

zip -P 123456 output.zip test.mp3

cat test.png output.zip > final.png

unzip final.png
```