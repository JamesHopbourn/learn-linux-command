#### 删除可执行文件
```
find . -type f -executable -delete
find . -type f -not -iname "*.*" -delete
```

#### 删除第二显示器的截屏
```
find . -type f -name "*(2)*" -delete
```
#### 杂项
```
find . -maxdepth 1 -type f -name ".*" -exec ls -l {} \;
find . -maxdepth 1 -type f -name ".*" -exec grep 'proxy' {} \;
find . -maxdepth 1 -type f -name ".*" -exec cp {} cpdir \;

➜ find . -type f -iname "*.sh" -exec echo {} \; -exec cat {} \; -printf "\n";
./dot.popclipext/dot.sh
result=$(echo "$POPCLIP_TEXT" | gsed '/^$/d ; s/^\([0-9]\|[0-9][0-9]\)、/\1. /g')
/bin/echo -n "$result"

./Highlight.popclipext/Highlight.sh
result=$(echo "$POPCLIP_TEXT"|sed 's/\*\*/::/g ; /^- / s//- ::/ ; /^- ::/ s/$/::/')
/bin/echo "$result"

./tr.popclipext/tr.sh
result=$(echo $POPCLIP_TEXT | tr -d '\n')
/bin/echo -n $result

./CN.popclipext/CN.sh
result=$(echo "$POPCLIP_TEXT" | gsed 's/,/，/g ; s/!/！/g ; s/?/？/g ; s/“/「/g ; s/”/」/g')
/bin/echo -n "$result"

./cats.popclipext/cats.sh
result=$(echo "$POPCLIP_TEXT" | sed '/^$/d')
/bin/echo -n "$result"

./h4.popclipext/h4.sh
result=$(echo "$POPCLIP_TEXT"|sed '1s/\*\*//g ; 1s/^.*\.// ; 1s/$/@/ ; 1s/^/#### / ; s/\*\*/::/g'|tr -d '\n'|tr '@' '\n')
/bin/echo "$result"
```
