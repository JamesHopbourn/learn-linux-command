#### 十六进制
```
xxd -r -p text_dump > binary_dump

xxd binary_dump

echo 6865792069742773206120737472696e670a | xxd -r -p
```

#### 二进制
```
xxd -b file

xxd -b assembly.md | cut -d \ -f2-7
```