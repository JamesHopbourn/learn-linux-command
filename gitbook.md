#### 安装 nvm、node7
```
brew install nvm

nvm install v7.1.0
```

#### 安装 gitbook、初始化
```
npm install gitbook-cli -g

gitbook init Book
```

#### 修改 copyPluginAssets 配置
```
sed -i '112s/ture/false/' ~/.gitbook/versions/3.2.3/lib/output/website/copyPluginAssets.js
```

#### 编辑测试目录
```
vim SUMMARY.md
# 概要

* [卷 I](part1/README.md)
    * [写作很棒](part1/writing.md)
    * [GitBook很酷](part1/gitbook.md)
* [卷 II](part2/README.md)
    * [期待反馈](part2/feedback_please.md)
    * [更好的写作工具](part2/better_tools.md)
```

#### 生成内容、运行
```
gitbook build

gitbook serve
```