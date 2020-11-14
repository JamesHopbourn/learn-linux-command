# utf-8 encode 编码
```
python -c 'print("我想摸鱼".encode("hex"))'
e68891e683b3e691b8e9b1bc

echo "%21%20" | python -c "import sys, urllib as ul; print ul.unquote(sys.stdin.read());"

python -c 'print("手机".encode("hex"))' | sed 's/.\{2\}/%&/g'

python3 -c 'print("我想摸鱼".encode("utf-8"))'
b'\xe6\x88\x91\xe6\x83\xb3\xe6\x91\xb8\xe9\xb1\xbc'

python3 -c 'print("我想摸鱼".encode("unicode_escape"))'
b'\\u6211\\u60f3\\u6478\\u9c7c'
```

```
echo '\xe6\x88\x91\xe6\x83\xb3\xe6\x91\xb8\xe9\xb1\xbc'
echo '\\u6211\\u60f3\\u6478\\u9c7c' | sed -e 's/\\/\\/g' -e "s/^/'/" -e "s/$/'/" -e "s/'//g"
```

```
>>> 此处是 python3
>>> text = '我想摸鱼'
>>> text.encode('utf-8')
b'\xe6\x88\x91\xe6\x83\xb3\xe6\x91\xb8\xe9\xb1\xbc'

>>> text.encode("unicode_escape")
b'\\u6211\\u60f3\\u6478\\u9c7c'
```

```
>>> str = u"中文"
>>> str
u'\u4e2d\u6587'
>>> str = "中文"
>>> str
'\xe4\xb8\xad\xe6\x96\x87'
```

```
python -c 'print("Hi"); print("Hi")'
```