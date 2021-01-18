#### 编辑 SD 卡 boot 文件
```
➜ echo 'enable_uart=1' >> /Volumes/boot/config.txt
```

#### 安装 screen
```
➜ brew install screen
==> Downloading https://homebrew.bintray.com/bottles/screen-4.8.0.catalina.bott
Already downloaded: /Users/james/Library/Caches/Homebrew/downloads/2b5c287ebc3e4ddf6701dded609fa509046c56f05a18784816a553ca8a134e0d--screen-4.8.0.catalina.bottle.tar.gz
==> Pouring screen-4.8.0.catalina.bottle.tar.gz
🍺  /usr/local/Cellar/screen/4.8.0: 28 files, 1.1MB
```

#### 查看 FT232 设备名称
```
➜ ls /dev/tty.usb*
/dev/tty.usbserial-A106TKSE
```

#### 连接杜邦线
```
VCC → 5V(GPIO 2)
GND → GND(GPIO 6)
TXD → UART RX(GPIO 15)
RXD → UART TX(GPIO 14)
```

#### 连接树莓派
```
➜ screen /dev/cu.usbserial-A106TKSE 115200

Raspbian GNU/Linux 10 raspberrypi ttyAMA0

raspberrypi login: root
Password:

root@raspberrypi:~#
```