#!/bin/sh

rm -rf ./build/*

for file in $(find . -name "*.c")
do {
    mkdir -p ./build 
    filename=`echo $file|awk -F . '{print $2}'|sed 's#.*/##'`
    gcc $file -o ./build/$filename -g
}
done
