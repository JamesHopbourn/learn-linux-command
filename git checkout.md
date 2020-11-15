### git checkout
#### 撤销工作区修改
```
git checkout -- README.md
git checkout -- .
```

#### 撤销暂存区修改
```
git reset --hard HEAD
```

#### 回退一个版本
```
git reset --hard HEAD^

git reset --hard HEAD^2
```

#### 修改提交记录
```
git commit --amend
```

