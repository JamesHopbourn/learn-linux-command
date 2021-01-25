#### zip compress
```
➜ zip others.zip others/*
  adding: others/awk.txt (deflated 49%)
  adding: others/ctf.txt (deflated 31%)
  adding: others/skill.txt (deflated 30%)
  adding: others/vim.txt (deflated 48%)
  adding: others/文本编辑命令.txt (deflated 68%)
  adding: others/自学计算机知识的一些建议和想法.txt (deflated 49%)
```
#### zipinfo
```
➜ zipinfo others.zip
Archive:  others.zip
Zip file size: 8379 bytes, number of entries: 6
-rw-r--r--  3.0 unx      484 tx defN 21-Jan-15 10:46 others/awk.txt
-rw-r--r--  3.0 unx      583 tx defN 21-Jan-15 10:46 others/ctf.txt
-rw-r--r--  3.0 unx     1214 tx defN 21-Jan-15 10:46 others/skill.txt
-rw-r--r--  3.0 unx     1751 tx defN 21-Jan-15 10:46 others/vim.txt
-rw-r--r--  3.0 unx     3965 tx defN 21-Jan-15 10:46 others/�??�?��?�?�?�令.txt
-rw-r--r--  3.0 unx     7150 tx defN 21-Jan-15 10:46 others/�?�学计�?�?��?��?�??�?�?建议�??�?��?.txt
6 files, 15147 bytes uncompressed, 7303 bytes compressed:  51.8%
```
#### zipnote
```
➜ zipnote others.zip
@ others/awk.txt
@ (comment above this line)
@ others/ctf.txt
@ (comment above this line)
@ others/skill.txt
@ (comment above this line)
@ others/vim.txt
@ (comment above this line)
@ others/文本编辑命令.txt
@ (comment above this line)
@ others/自学计算机知识的一些建议和想法.txt
@ (comment above this line)
@ (zip file comment below this line)

➜ zipnote others.zip > comments 

➜ vim comments

➜ zipnote others.zip < comments 
[ERROR] it is a bug fix on zip v3.1 beta
```
#### zipgrep
```
zipgrep 'awk' others.zip
others/awk.txt:https://linuxhint.com/20_awk_examples/#content
others/awk.txt:awk with printf
others/awk.txt:awk to split on white space
others/awk.txt:awk to change the delimiter
others/awk.txt:awk with tab-delimited data
others/awk.txt:awk with csv data
others/awk.txt:awk regex
others/awk.txt:awk case insensitive regex
others/awk.txt:awk with nf (number of fields) variable
others/awk.txt:awk gensub() function
others/awk.txt:awk with rand() function
others/awk.txt:awk user defined function
others/awk.txt:awk if
others/awk.txt:awk variables
others/awk.txt:awk arrays
others/awk.txt:awk loop
others/awk.txt:awk to print the first column
others/awk.txt:awk to print the last column
others/awk.txt:awk with grep
others/awk.txt:awk with the bash script file
others/awk.txt:awk with sed
others/�??�?��?�?�?�令.txt:line=$(wc -l new.txt | awk '{print $1}'| tee /dev/tty)
others/�??�?��?�?�?�令.txt:awk
others/�??�?��?�?�?�令.txt:awk -d ' ' '{print $1}'
```
#### encrypt zip
```
cp others.zip /tmp

zipcloak others.zip
Enter password:
Verify password:
encrypting: others/awk.txt
encrypting: others/ctf.txt
encrypting: others/skill.txt
encrypting: others/vim.txt
encrypting: others/文本编辑命令.txt
encrypting: others/自学计算机知识的一些建议和想法.txt
```
#### details
```
zipdetails others.zip

0000 LOCAL HEADER #1       04034B50
0004 Extract Zip Spec      14 '2.0'
0005 Extract OS            00 'MS-DOS'
0006 General Purpose Flag  0001
     [Bit  0]              1 'Encryption'
     [Bits 1-2]            1 'Maximum Compression'
0008 Compression Method    0008 'Deflated'
000A Last Mod Time         522F55C4 'Fri Jan 15 10:46:08 2021'
000E CRC                   05A120FD
0012 Compressed Length     00000102
0016 Uncompressed Length   000001E4
001A Filename Length       000E
001C Extra Length          001C
001E Filename              'others/awk.txt'
002C Extra ID #0001        5455 'UT: Extended Timestamp'
002E   Length              0009
0030   Flags               '03 mod access'
0031   Mod Time            600101EF 'Fri Jan 15 10:46:07 2021'
0035   Access Time         600101F0 'Fri Jan 15 10:46:08 2021'
0039 Extra ID #0002        7875 'ux: Unix Extra Type 3'
003B   Length              000B
003D   Version             01
003E   UID Size            04
003F   UID                 000001F5
0043   GID Size            04
0044   GID                 00000014
0048 PAYLOAD

014A LOCAL HEADER #2       04034B50
014E Extract Zip Spec      14 '2.0'
014F Extract OS            00 'MS-DOS'
0150 General Purpose Flag  0001
     [Bit  0]              1 'Encryption'
     [Bits 1-2]            1 'Maximum Compression'
0152 Compression Method    0008 'Deflated'
0154 Last Mod Time         522F55C4 'Fri Jan 15 10:46:08 2021'
0158 CRC                   50743DA4
015C Compressed Length     0000019E
0160 Uncompressed Length   00000247
0164 Filename Length       000E
0166 Extra Length          001C
0168 Filename              'others/ctf.txt'
0176 Extra ID #0001        5455 'UT: Extended Timestamp'
0178   Length              0009
017A   Flags               '03 mod access'
017B   Mod Time            600101EF 'Fri Jan 15 10:46:07 2021'
017F   Access Time         600101F0 'Fri Jan 15 10:46:08 2021'
0183 Extra ID #0002        7875 'ux: Unix Extra Type 3'
0185   Length              000B
0187   Version             01
0188   UID Size            04
0189   UID                 000001F5
018D   GID Size            04
018E   GID                 00000014
0192 PAYLOAD

0330 LOCAL HEADER #3       04034B50
0334 Extract Zip Spec      14 '2.0'
0335 Extract OS            00 'MS-DOS'
0336 General Purpose Flag  0001
     [Bit  0]              1 'Encryption'
     [Bits 1-2]            1 'Maximum Compression'
0338 Compression Method    0008 'Deflated'
033A Last Mod Time         522F55C4 'Fri Jan 15 10:46:08 2021'
033E CRC                   485830C9
0342 Compressed Length     0000035C
0346 Uncompressed Length   000004BE
034A Filename Length       0010
034C Extra Length          001C
034E Filename              'others/skill.txt'
035E Extra ID #0001        5455 'UT: Extended Timestamp'
0360   Length              0009
0362   Flags               '03 mod access'
0363   Mod Time            600101EF 'Fri Jan 15 10:46:07 2021'
0367   Access Time         600101F0 'Fri Jan 15 10:46:08 2021'
036B Extra ID #0002        7875 'ux: Unix Extra Type 3'
036D   Length              000B
036F   Version             01
0370   UID Size            04
0371   UID                 000001F5
0375   GID Size            04
0376   GID                 00000014
037A PAYLOAD

06D6 LOCAL HEADER #4       04034B50
06DA Extract Zip Spec      14 '2.0'
06DB Extract OS            00 'MS-DOS'
06DC General Purpose Flag  0001
     [Bit  0]              1 'Encryption'
     [Bits 1-2]            1 'Maximum Compression'
06DE Compression Method    0008 'Deflated'
06E0 Last Mod Time         522F55C4 'Fri Jan 15 10:46:08 2021'
06E4 CRC                   926C57C2
06E8 Compressed Length     00000396
06EC Uncompressed Length   000006D7
06F0 Filename Length       000E
06F2 Extra Length          001C
06F4 Filename              'others/vim.txt'
0702 Extra ID #0001        5455 'UT: Extended Timestamp'
0704   Length              0009
0706   Flags               '03 mod access'
0707   Mod Time            600101EF 'Fri Jan 15 10:46:07 2021'
070B   Access Time         600101F0 'Fri Jan 15 10:46:08 2021'
070F Extra ID #0002        7875 'ux: Unix Extra Type 3'
0711   Length              000B
0713   Version             01
0714   UID Size            04
0715   UID                 000001F5
0719   GID Size            04
071A   GID                 00000014
071E PAYLOAD

0AB4 LOCAL HEADER #5       04034B50
0AB8 Extract Zip Spec      14 '2.0'
0AB9 Extract OS            00 'MS-DOS'
0ABA General Purpose Flag  0001
     [Bit  0]              1 'Encryption'
     [Bits 1-2]            1 'Maximum Compression'
0ABC Compression Method    0008 'Deflated'
0ABE Last Mod Time         522F55C4 'Fri Jan 15 10:46:08 2021'
0AC2 CRC                   DA3890DA
0AC6 Compressed Length     000004F4
0ACA Uncompressed Length   00000F7D
0ACE Filename Length       001D
0AD0 Extra Length          001C
0AD2 Filename              'others/文本编辑命令.txt'
0AEF Extra ID #0001        5455 'UT: Extended Timestamp'
0AF1   Length              0009
0AF3   Flags               '03 mod access'
0AF4   Mod Time            600101EF 'Fri Jan 15 10:46:07 2021'
0AF8   Access Time         600101F0 'Fri Jan 15 10:46:08 2021'
0AFC Extra ID #0002        7875 'ux: Unix Extra Type 3'
0AFE   Length              000B
0B00   Version             01
0B01   UID Size            04
0B02   UID                 000001F5
0B06   GID Size            04
0B07   GID                 00000014
0B0B PAYLOAD

0FFF LOCAL HEADER #6       04034B50
1003 Extract Zip Spec      14 '2.0'
1004 Extract OS            00 'MS-DOS'
1005 General Purpose Flag  0001
     [Bit  0]              1 'Encryption'
     [Bits 1-2]            1 'Maximum Compression'
1007 Compression Method    0008 'Deflated'
1009 Last Mod Time         522F55C4 'Fri Jan 15 10:46:08 2021'
100D CRC                   CBB382CB
1011 Compressed Length     00000E49
1015 Uncompressed Length   00001BEE
1019 Filename Length       0038
101B Extra Length          001C
101D Filename              'others/自学计算机知识的一些�
                           �议和想法.txt'
1055 Extra ID #0001        5455 'UT: Extended Timestamp'
1057   Length              0009
1059   Flags               '03 mod access'
105A   Mod Time            600101EF 'Fri Jan 15 10:46:07 2021'
105E   Access Time         600101F0 'Fri Jan 15 10:46:08 2021'
1062 Extra ID #0002        7875 'ux: Unix Extra Type 3'
1064   Length              000B
1066   Version             01
1067   UID Size            04
1068   UID                 000001F5
106C   GID Size            04
106D   GID                 00000014
1071 PAYLOAD

1EBA CENTRAL HEADER #1     02014B50
1EBE Created Zip Spec      1E '3.0'
1EBF Created OS            03 'Unix'
1EC0 Extract Zip Spec      14 '2.0'
1EC1 Extract OS            00 'MS-DOS'
1EC2 General Purpose Flag  0001
     [Bit  0]              1 'Encryption'
     [Bits 1-2]            1 'Maximum Compression'
1EC4 Compression Method    0008 'Deflated'
1EC6 Last Mod Time         522F55C4 'Fri Jan 15 10:46:08 2021'
1ECA CRC                   05A120FD
1ECE Compressed Length     00000102
1ED2 Uncompressed Length   000001E4
1ED6 Filename Length       000E
1ED8 Extra Length          0018
1EDA Comment Length        0000
1EDC Disk Start            0000
1EDE Int File Attributes   0001
     [Bit 0]               1 Text Data
1EE0 Ext File Attributes   81A40000
1EE4 Local Header Offset   00000000
1EE8 Filename              'others/awk.txt'
1EF6 Extra ID #0001        5455 'UT: Extended Timestamp'
1EF8   Length              0005
1EFA   Flags               '03 mod access'
1EFB   Mod Time            600101EF 'Fri Jan 15 10:46:07 2021'
1EFF Extra ID #0002        7875 'ux: Unix Extra Type 3'
1F01   Length              000B
1F03   Version             01
1F04   UID Size            04
1F05   UID                 000001F5
1F09   GID Size            04
1F0A   GID                 00000014

1F0E CENTRAL HEADER #2     02014B50
1F12 Created Zip Spec      1E '3.0'
1F13 Created OS            03 'Unix'
1F14 Extract Zip Spec      14 '2.0'
1F15 Extract OS            00 'MS-DOS'
1F16 General Purpose Flag  0001
     [Bit  0]              1 'Encryption'
     [Bits 1-2]            1 'Maximum Compression'
1F18 Compression Method    0008 'Deflated'
1F1A Last Mod Time         522F55C4 'Fri Jan 15 10:46:08 2021'
1F1E CRC                   50743DA4
1F22 Compressed Length     0000019E
1F26 Uncompressed Length   00000247
1F2A Filename Length       000E
1F2C Extra Length          0018
1F2E Comment Length        0000
1F30 Disk Start            0000
1F32 Int File Attributes   0001
     [Bit 0]               1 Text Data
1F34 Ext File Attributes   81A40000
1F38 Local Header Offset   0000014A
1F3C Filename              'others/ctf.txt'
1F4A Extra ID #0001        5455 'UT: Extended Timestamp'
1F4C   Length              0005
1F4E   Flags               '03 mod access'
1F4F   Mod Time            600101EF 'Fri Jan 15 10:46:07 2021'
1F53 Extra ID #0002        7875 'ux: Unix Extra Type 3'
1F55   Length              000B
1F57   Version             01
1F58   UID Size            04
1F59   UID                 000001F5
1F5D   GID Size            04
1F5E   GID                 00000014

1F62 CENTRAL HEADER #3     02014B50
1F66 Created Zip Spec      1E '3.0'
1F67 Created OS            03 'Unix'
1F68 Extract Zip Spec      14 '2.0'
1F69 Extract OS            00 'MS-DOS'
1F6A General Purpose Flag  0001
     [Bit  0]              1 'Encryption'
     [Bits 1-2]            1 'Maximum Compression'
1F6C Compression Method    0008 'Deflated'
1F6E Last Mod Time         522F55C4 'Fri Jan 15 10:46:08 2021'
1F72 CRC                   485830C9
1F76 Compressed Length     0000035C
1F7A Uncompressed Length   000004BE
1F7E Filename Length       0010
1F80 Extra Length          0018
1F82 Comment Length        0000
1F84 Disk Start            0000
1F86 Int File Attributes   0001
     [Bit 0]               1 Text Data
1F88 Ext File Attributes   81A40000
1F8C Local Header Offset   00000330
1F90 Filename              'others/skill.txt'
1FA0 Extra ID #0001        5455 'UT: Extended Timestamp'
1FA2   Length              0005
1FA4   Flags               '03 mod access'
1FA5   Mod Time            600101EF 'Fri Jan 15 10:46:07 2021'
1FA9 Extra ID #0002        7875 'ux: Unix Extra Type 3'
1FAB   Length              000B
1FAD   Version             01
1FAE   UID Size            04
1FAF   UID                 000001F5
1FB3   GID Size            04
1FB4   GID                 00000014

1FB8 CENTRAL HEADER #4     02014B50
1FBC Created Zip Spec      1E '3.0'
1FBD Created OS            03 'Unix'
1FBE Extract Zip Spec      14 '2.0'
1FBF Extract OS            00 'MS-DOS'
1FC0 General Purpose Flag  0001
     [Bit  0]              1 'Encryption'
     [Bits 1-2]            1 'Maximum Compression'
1FC2 Compression Method    0008 'Deflated'
1FC4 Last Mod Time         522F55C4 'Fri Jan 15 10:46:08 2021'
1FC8 CRC                   926C57C2
1FCC Compressed Length     00000396
1FD0 Uncompressed Length   000006D7
1FD4 Filename Length       000E
1FD6 Extra Length          0018
1FD8 Comment Length        0000
1FDA Disk Start            0000
1FDC Int File Attributes   0001
     [Bit 0]               1 Text Data
1FDE Ext File Attributes   81A40000
1FE2 Local Header Offset   000006D6
1FE6 Filename              'others/vim.txt'
1FF4 Extra ID #0001        5455 'UT: Extended Timestamp'
1FF6   Length              0005
1FF8   Flags               '03 mod access'
1FF9   Mod Time            600101EF 'Fri Jan 15 10:46:07 2021'
1FFD Extra ID #0002        7875 'ux: Unix Extra Type 3'
1FFF   Length              000B
2001   Version             01
2002   UID Size            04
2003   UID                 000001F5
2007   GID Size            04
2008   GID                 00000014

200C CENTRAL HEADER #5     02014B50
2010 Created Zip Spec      1E '3.0'
2011 Created OS            03 'Unix'
2012 Extract Zip Spec      14 '2.0'
2013 Extract OS            00 'MS-DOS'
2014 General Purpose Flag  0001
     [Bit  0]              1 'Encryption'
     [Bits 1-2]            1 'Maximum Compression'
2016 Compression Method    0008 'Deflated'
2018 Last Mod Time         522F55C4 'Fri Jan 15 10:46:08 2021'
201C CRC                   DA3890DA
2020 Compressed Length     000004F4
2024 Uncompressed Length   00000F7D
2028 Filename Length       001D
202A Extra Length          0018
202C Comment Length        0000
202E Disk Start            0000
2030 Int File Attributes   0001
     [Bit 0]               1 Text Data
2032 Ext File Attributes   81A40000
2036 Local Header Offset   00000AB4
203A Filename              'others/文本编辑命令.txt'
2057 Extra ID #0001        5455 'UT: Extended Timestamp'
2059   Length              0005
205B   Flags               '03 mod access'
205C   Mod Time            600101EF 'Fri Jan 15 10:46:07 2021'
2060 Extra ID #0002        7875 'ux: Unix Extra Type 3'
2062   Length              000B
2064   Version             01
2065   UID Size            04
2066   UID                 000001F5
206A   GID Size            04
206B   GID                 00000014

206F CENTRAL HEADER #6     02014B50
2073 Created Zip Spec      1E '3.0'
2074 Created OS            03 'Unix'
2075 Extract Zip Spec      14 '2.0'
2076 Extract OS            00 'MS-DOS'
2077 General Purpose Flag  0001
     [Bit  0]              1 'Encryption'
     [Bits 1-2]            1 'Maximum Compression'
2079 Compression Method    0008 'Deflated'
207B Last Mod Time         522F55C4 'Fri Jan 15 10:46:08 2021'
207F CRC                   CBB382CB
2083 Compressed Length     00000E49
2087 Uncompressed Length   00001BEE
208B Filename Length       0038
208D Extra Length          0018
208F Comment Length        0000
2091 Disk Start            0000
2093 Int File Attributes   0001
     [Bit 0]               1 Text Data
2095 Ext File Attributes   81A40000
2099 Local Header Offset   00000FFF
209D Filename              'others/自学计算机知识的一些�
                           �议和想法.txt'
20D5 Extra ID #0001        5455 'UT: Extended Timestamp'
20D7   Length              0005
20D9   Flags               '03 mod access'
20DA   Mod Time            600101EF 'Fri Jan 15 10:46:07 2021'
20DE Extra ID #0002        7875 'ux: Unix Extra Type 3'
20E0   Length              000B
20E2   Version             01
20E3   UID Size            04
20E4   UID                 000001F5
20E8   GID Size            04
20E9   GID                 00000014

20ED END CENTRAL HEADER    06054B50
20F1 Number of this disk   0000
20F3 Central Dir Disk no   0000
20F5 Entries in this disk  0006
20F7 Total Entries         0006
20F9 Size of Central Dir   00000233
20FD Offset to Central Dir 00001EBA
2101 Comment Length        0000
Done
```
#### zcat
```
➜ cat 素数判断.c
#include <math.h>
#include <stdio.h>

int main() {
  int num, flag = 0;
  scanf("%d", &num);
  for(int i = 2; i * i <= num; i++)
    if(num % i == 0) {
      flag = 1;
      break;
    }
  if(flag)
    printf("%d 不是素数", num);
  else
    printf("%d 是个素数", num);
}

➜ gzip 素数判断.c

➜ zcat 素数判断.c.gz
#include <math.h>
#include <stdio.h>

int main() {
  int num, flag = 0;
  scanf("%d", &num);
  for(int i = 2; i * i <= num; i++)
    if(num % i == 0) {
      flag = 1;
      break;
    }
  if(flag)
    printf("%d 不是素数", num);
  else
    printf("%d 是个素数", num);
}

➜ zcat -l 素数判断.c.gz
         compressed        uncompressed  ratio uncompressed_name
                217                 279  34.1% 素数判断.c
```
#### unzip unar
```
➜ unzip others.zip
Archive:  others.zip
  inflating: others/awk.txt
  inflating: others/ctf.txt
  inflating: others/skill.txt
  inflating: others/vim.txt
  inflating: others/�??�?��?�?�?�令.txt
  inflating: others/�?�学计�?�?��?��?�??�?�?建议�??�?��?.txt

➜ unar others.zip
others.zip: Zip
  others/awk.txt  (484 B)... OK.
  others/ctf.txt  (583 B)... OK.
  others/skill.txt  (1214 B)... OK.
  others/vim.txt  (1751 B)... OK.
  others/文本编辑命令.txt  (3965 B)... OK.
  others/自学计算机知识的一些建议和想法.txt  (7150 B)... OK.
Successfully extracted to "./others".
```
#### zip 炸弹
```
➜ dd if=/dev/zero count=$((1024*1024)) bs=10240 of=bigFile.csv
➜ zip -9 bigFile.zip bigFile.csv
```
#### 不含 MACOS 的压缩包
```
➜ zip -r compressed.zip /path/to/dir

➜ 7z a -tzip compressed.zip /path/to/dir
```
#### 图片藏压缩包
```
➜ zip output.zip test.mp3

➜ zip -P 123456 output.zip test.mp3

➜ cat test.png output.zip > final.png

➜ unzip final.png
```
#### 压缩包伪加密
```
➜ zip -r test.zip /etc/hosts
updating: IMG_5449.jpeg (deflated 3%)

➜ xxd test.zip dump

➜ cat dump|head
00000000: 504b 0304 1400 0000 0800 58bd 2852 fec4  PK........X.(R..
00000010: 760a 2d44 0300 4661 0300 0d00 1c00 494d  v.-D..Fa......IM
00000020: 475f 3534 3439 2e6a 7065 6755 5409 0003  G_5449.jpegUT...
00000030: 787d f85f 0c8e 0b60 7578 0b00 0104 f501  x}._...`ux......
00000040: 0000 0414 0000 009c bd79 4052 e9df 37cc  .........y@R..7.
00000050: 4c4d 4d39 657b 538e 32ad 56a6 4e99 3299  LMM9e{S.2.V.N.2.
00000060: ca94 95a5 9965 2aee 4c8b 2b22 4dee 8a9c  .....e*.L.+"M...
00000070: 5fd3 62ea 9853 a68e 9a52 999a 2ba6 2229  _.b..S...R..+.")
00000080: 08e5 9229 2ab9 92a0 92fb 82c8 a62c 0287  ...)*........,..
00000090: f738 f77d 3fcf f3c7 f3c7 fbbe 47d1 231e  .8.}?.......G.#.

➜ sed -i 's/0000/0900/3' dump

➜ md5 dump
MD5 (dump) = 5ca7cbfc9e727811bdcf2c290c78c8f6

➜ cat dump|head
00000000: 504b 0304 1400 0900 0800 58bd 2852 fec4  PK........X.(R..
00000010: 760a 2d44 0300 4661 0300 0d00 1c00 494d  v.-D..Fa......IM
00000020: 475f 3534 3439 2e6a 7065 6755 5409 0003  G_5449.jpegUT...
00000030: 787d f85f 0c8e 0b60 7578 0b00 0104 f501  x}._...`ux......
00000040: 0000 0414 0900 009c bd79 4052 e9df 37cc  .........y@R..7.
00000050: 4c4d 4d39 657b 538e 32ad 56a6 4e99 3299  LMM9e{S.2.V.N.2.
00000060: ca94 95a5 9965 2aee 4c8b 2b22 4dee 8a9c  .....e*.L.+"M...
00000070: 5fd3 62ea 9853 a68e 9a52 999a 2ba6 2229  _.b..S...R..+.")
00000080: 08e5 9229 2ab9 92a0 92fb 82c8 a62c 0287  ...)*........,..
00000090: f738 f77d 3fcf f3c7 f3c7 fbbe 47d1 231e  .8.}?.......G.#.

➜ xxd -r dump > test.zip

➜ open test.zip
```
#### 压缩包伪加密破解
```
➜ xxd test.zip dump

➜ md5 dump
MD5 (dump) = 5ca7cbfc9e727811bdcf2c290c78c8f6

➜ cat dump|head
00000000: 504b 0304 1400 0900 0800 58bd 2852 fec4  PK........X.(R..
00000010: 760a 2d44 0300 4661 0300 0d00 1c00 494d  v.-D..Fa......IM
00000020: 475f 3534 3439 2e6a 7065 6755 5409 0003  G_5449.jpegUT...
00000030: 787d f85f 0c8e 0b60 7578 0b00 0104 f501  x}._...`ux......
00000040: 0000 0414 0900 009c bd79 4052 e9df 37cc  .........y@R..7.
00000050: 4c4d 4d39 657b 538e 32ad 56a6 4e99 3299  LMM9e{S.2.V.N.2.
00000060: ca94 95a5 9965 2aee 4c8b 2b22 4dee 8a9c  .....e*.L.+"M...
00000070: 5fd3 62ea 9853 a68e 9a52 999a 2ba6 2229  _.b..S...R..+.")
00000080: 08e5 9229 2ab9 92a0 92fb 82c8 a62c 0287  ...)*........,..
00000090: f738 f77d 3fcf f3c7 f3c7 fbbe 47d1 231e  .8.}?.......G.#.

➜ sed -i 's/0900/0000/1' dump

➜ cat dump|head
00000000: 504b 0304 1400 0000 0800 58bd 2852 fec4  PK........X.(R..
00000010: 760a 2d44 0300 4661 0300 0d00 1c00 494d  v.-D..Fa......IM
00000020: 475f 3534 3439 2e6a 7065 6755 5409 0003  G_5449.jpegUT...
00000030: 787d f85f 0c8e 0b60 7578 0b00 0104 f501  x}._...`ux......
00000040: 0000 0414 0000 009c bd79 4052 e9df 37cc  .........y@R..7.
00000050: 4c4d 4d39 657b 538e 32ad 56a6 4e99 3299  LMM9e{S.2.V.N.2.
00000060: ca94 95a5 9965 2aee 4c8b 2b22 4dee 8a9c  .....e*.L.+"M...
00000070: 5fd3 62ea 9853 a68e 9a52 999a 2ba6 2229  _.b..S...R..+.")
00000080: 08e5 9229 2ab9 92a0 92fb 82c8 a62c 0287  ...)*........,..
00000090: f738 f77d 3fcf f3c7 f3c7 fbbe 47d1 231e  .8.}?.......G.#.

➜ xxd -r dump > test.zip

➜ unzip test.zip
Archive:  test.zip
  inflating: etc/hosts
```

#### zip crc crack
[kmyk/zip](https://github.com/kmyk/zip-crc-cracker)  
[CRC32爆破小结](https://0verwatch.top/CRC32-Brute.html)  
[zip压缩包--加密破解篇.pdf](https://scriptkid-beta.github.io/pdf/zip%E5%8E%8B%E7%BC%A9%E5%8C%85--%E5%8A%A0%E5%AF%86%E7%A0%B4%E8%A7%A3%E7%AF%87.pdf)  