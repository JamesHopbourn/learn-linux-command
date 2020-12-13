#### 删除可执行文件
```
find . -type f -executable -delete
find . -type f -not -iname "*.*" -delete
```

#### 杂项
```
find . -maxdepth 1 -type f -name ".*" -exec ls -l {} \;
find . -maxdepth 1 -type f -name ".*" -exec grep 'proxy' {} \;
find . -maxdepth 1 -type f -name ".*" -exec cp {} cpdir \;
```
