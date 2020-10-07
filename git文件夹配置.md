├── COMMIT_EDITMSG                                             # 文本文件，最后一次 commit 注释
├── FETCH_HEAD                                                 # 文本文件，每个分支最后一次和服务器通信的最后 commit SHA1 值
├── HEAD                                                       # 文本文件，当前工作区所在的分支
├── ORIG_HEAD                                                  # 文本文件，同步当前分支和远程分支最后一个 commit SHA1 值
├── config                                                     # git 相关配置，比如远程地址、分支指向、策略、模式等
├── description
├── hooks                                                      # 钩子，在不同生命周期 git 暴露出的相关钩子
│   ├── applypatch-msg.sample
│   ├── commit-msg.sample
│   ├── fsmonitor-watchman.sample
│   ├── post-update.sample
│   ├── pre-applypatch.sample
│   ├── pre-commit.sample
│   ├── pre-merge-commit.sample
│   ├── pre-push.sample
│   ├── pre-rebase.sample
│   ├── pre-receive.sample
│   ├── prepare-commit-msg
│   ├── prepare-commit-msg.sample
│   └── update.sample
├── index                                                      # 暂存区，索引文件，可以用 git ls-files 查看
├── info
│   └── exclude
├── logs                                                       # 提交日志，各个分支都有，这也就是 git 离线之后可以 log 的原因
│   ├── HEAD
│   └── refs
│       ├── heads
│       │   └── master
│       └── remotes
│           └── origin
│               ├── HEAD
│               └── master
├── objects                                                    # 文件存储最重要的一个目录
│   ├── 02                                                     # 松散文件存储文件夹，文件夹名来自 SHA1 前两个字符
│   │   └── 61c0b54715c5dc1c1f7e6bb20d8bba3c47cdb8
│   ├── 03
│   │   └── add3604eb171fdaada460eb804c98f1154f32d
│   ├── 04
│   │   └── 52210e5669b622b28cace33b69052e7f1dee8c
│   ├── info                                                   # 目录 info，比如打包文件名是什么等
│   └── pack
│       ├── pack-dc18d08a84ec8d97998121311aea715cf7a80045.idx
│       └── pack-dc18d08a84ec8d97998121311aea715cf7a80045.pack
├── packed-refs                                                # 将 refs 下文件进行打包到一个文件，一般是每个分支最后一个修改集
└── refs                                                       # 每个分支最后一个修改集，分支其实就是一个快照，快照体现就是修改集
    ├── heads
    │   └── master
    ├── remotes
    │   └── origin
    │       ├── HEAD
    │       └── master
    └── tags
