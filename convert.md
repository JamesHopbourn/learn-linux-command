### 拼接图片
```
cd 用所选项目新建的文件夹;convert *.png -append result-sprite.png;mv result-sprite.png ../;rm *;cd ~/Desktop;rmdir 用所选项目新建的文件夹

rm *[!(2)].png

find . -type f -name "New*" -print0 |xargs -0 -r rm
```
