#!/bin/sh
IFS=$'\n'
cd $1
for item in `ls|grep -E "(mp4|mov)" `
do 
part=`echo $item| cut -d" " -f1`
y=`echo $part | cut -d"-" -f1`
m=`echo $part | cut -d"-" -f2`
d=`echo $part | cut -d"-" -f3`
folder=videos/$y/$m/$d
mkdir -p $folder
mv $item $folder/
done
