#### binwalk with dd
```
$ cat 1.png 2.png > 3.png
$ binwalk 3.png
DECIMAL       HEXADECIMAL     DESCRIPTION
--------------------------------------------------------------------------------
0             0x0             PNG image, 1152 x 2048, 8-bit colormap, non-interlaced
881           0x371           TIFF image data, big-endian, offset of first image directory: 8
1259432       0x1337A8        PNG image, 1242 x 2208, 16-bit/color RGBA, non-interlaced
1259838       0x13393E        TIFF image data, big-endian, offset of first image directory: 8

$ dd if=3.png of=new.png skip=1259432 bs=1
434505+0 records in
434505+0 records out
434505 bytes (435 kB, 424 KiB) copied, 2.2454 s, 194 kB/s

$ cat 1.png flag.zip > 3.png
$ binwalk 3.png
DECIMAL       HEXADECIMAL     DESCRIPTION
--------------------------------------------------------------------------------
0             0x0             PNG image, 1152 x 2048, 8-bit colormap, non-interlaced
881           0x371           TIFF image data, big-endian, offset of first image directory: 8
1259432       0x1337A8        Zip archive data, at least v1.0 to extract, compressed size: 9, uncompressed size: 9, name: flag.txt
1259585       0x133841        End of Zip archive, footer length: 22
```

