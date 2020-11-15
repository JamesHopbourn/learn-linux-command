#### 文件单独打包
```
ls -1 * | xargs -n 1 bash -c 'zip "$0".zip "$0"'
```