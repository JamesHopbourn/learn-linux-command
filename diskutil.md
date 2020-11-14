解决无法抹掉磁盘的报错
``` 
diskutil list

diskutil eraseDisk free EMPTY /dev/disk2

diskutil eraseDisk ExFAT USB64 /dev/disk2 
``` 