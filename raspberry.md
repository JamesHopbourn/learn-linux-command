#### 连接树莓派
```
 ssh pi@raspberrypi.local
pi@raspberrypi:~#
```

#### root 登陆
```
pi@raspberrypi:~# sudo passwd root

pi@raspberrypi:~# sudo sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

pi@raspberrypi:~# sudo service ssh restart

 ssh root@raspberrypi.local
pi@raspberrypi.local's password:
Linux raspberrypi 5.4.51-v7+ #1333 SMP Mon Aug 10 16:45:19 BST 2020 armv7l

The programs included with the Debian GNU/Linux system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Debian GNU/Linux comes with ABSOLUTELY NO WARRANTY, to the extent
permitted by applicable law.
root@raspberrypi:~#
```

#### 关闭登陆提示
```
 ssh root@raspberrypi.local
Linux raspberrypi 5.4.51-v7+ #1333 SMP Mon Aug 10 16:45:19 BST 2020 armv7l

The programs included with the Debian GNU/Linux system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Debian GNU/Linux comes with ABSOLUTELY NO WARRANTY, to the extent
permitted by applicable law.
Last login: Sun Jan 17 03:33:24 2021 from 192.168.0.107

➜  ~ touch .hushlogin

➜  ~ exit
Connection to raspberrypi.local closed.

 ssh root@raspberrypi.local
➜  ~
```

#### 免密登陆
```
 ssh-keygen
Generating public/private rsa key pair.
Enter file in which to save the key (/Users/james/.ssh/id_rsa):
Enter passphrase (empty for no passphrase):
Enter same passphrase again:
Your identification has been saved in /Users/james/.ssh/id_rsa.
Your public key has been saved in /Users/james/.ssh/id_rsa.pub.
The key fingerprint is:
SHA256:9X8TvVOs3mOymMoifZCKVsl2s5jpSvoMLaPo8u879rc james@james.local
The key's randomart image is:
+---[RSA 3072]----+
|                 |
|                 |
|          .      |
|         . .   ..|
|    . . S   .  .+|
|  .  = =     . .+|
| + o+ B +     o+.|
|+ Boo* +o.  oo =o|
|=++B*=o.E+.o .= o|
+----[SHA256]-----+

 ssh-copy-id root@raspberrypi.local
/usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed
/usr/bin/ssh-copy-id: INFO: 1 key(s) remain to be installed -- if you are prompted now it is to install the new keys
root@raspberrypi.local's password:

Number of key(s) added: 1

Now try logging into the machine, with:   "ssh 'root@raspberrypi.local'"
and check to make sure that only the key(s) you wanted were added.

 ssh root@raspberrypi.local
➜  ~
```

#### 修改 hosts
```
root@raspberrypi:~# vi /etc/hosts
199.232.96.133 raw.githubusercontent.com
```

#### 转发网络代理
```
 scutil --proxy|sed -n '/Port/p'
  HTTPPort : 8888
  HTTPSPort : 8888
  SOCKSPort : 8889

 ssh -fNTR 1234:localhost:8888 root@raspberrypi.local

 ssh root@raspberrypi.local

root@raspberrypi:~# export https_proxy=http://127.0.0.1:1234;export http_proxy=http://127.0.0.1:1234

root@raspberrypi:~# sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
Cloning Oh My Zsh...
Cloning into '/root/.oh-my-zsh'...
remote: Enumerating objects: 1194, done.
remote: Counting objects: 100% (1194/1194), done.
remote: Compressing objects: 100% (1162/1162), done.
remote: Total 1194 (delta 19), reused 1109 (delta 16), pack-reused 0
Receiving objects: 100% (1194/1194), 827.35 KiB | 412.00 KiB/s, done.
Resolving deltas: 100% (19/19), done.

Looking for an existing zsh config...
Using the Oh My Zsh template file and adding it to ~/.zshrc.

Time to change your default shell to zsh:
Do you want to change your default shell to zsh? [Y/n] Y
Changing the shell...
Shell successfully changed to '/usr/bin/zsh'.

         __                                     __
  ____  / /_     ____ ___  __  __   ____  _____/ /_
 / __ \/ __ \   / __ `__ \/ / / /  /_  / / ___/ __ \
/ /_/ / / / /  / / / / / / /_/ /    / /_(__  ) / / /
\____/_/ /_/  /_/ /_/ /_/\__, /    /___/____/_/ /_/
                        /____/                       ....is now installed!


Before you scream Oh My Zsh! please look over the ~/.zshrc file to select plugins, themes, and options.

• Follow us on Twitter: https://twitter.com/ohmyzsh
• Join our Discord server: https://discord.gg/ohmyzsh
• Get stickers, shirts, coffee mugs and other swag: https://shop.planetargon.com/collections/oh-my-zsh

➜ echo 'export https_proxy=http://127.0.0.1:1234;export http_proxy=http://127.0.0.1:1234' >> ~/.zshrc

➜ source ~/.zshrc
```

#### 查看 Debian 版本
```
➜ lsb_release -a
No LSB modules are available.
Distributor ID:	Raspbian
Description:	Ra spbian GNU/Linux 10 (buster)
Release:	10
Codename:	buster
```

#### 替换清华源
```
➜ :> /etc/apt/sources.list
➜ vi /etc/apt/sources.list
deb http://mirrors.tuna.tsinghua.edu.cn/raspbian/raspbian/ buster main non-free contrib rpi
deb-src http://mirrors.tuna.tsinghua.edu.cn/raspbian/raspbian/ buster main non-free contrib rpi

➜ :> /etc/apt/sources.list.d/raspi.list
➜ vi /etc/apt/sources.list.d/raspi.list
deb http://mirrors.tuna.tsinghua.edu.cn/raspberrypi/ buster main ui

➜ apt-get update
Get:1 http://mirrors.tuna.tsinghua.edu.cn/raspbian/raspbian buster InRelease [15.0 kB]
Get:2 http://mirrors.tuna.tsinghua.edu.cn/raspberrypi buster InRelease [32.8 kB]
Get:3 http://mirrors.tuna.tsinghua.edu.cn/raspberrypi buster/main armhf Packages [351 kB]
Fetched 399 kB in 7s (61.0 kB/s)
Reading package lists... Done
```
