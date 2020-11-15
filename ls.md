#### 排除 C 文件
```
ls -I "*.c"
```

#### 排除 docx 文件后删除其他文件
```
ls -I "*.docx"|xargs rm -rf
```