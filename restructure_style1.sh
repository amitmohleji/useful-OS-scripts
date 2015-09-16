#!/bin/sh
IFS=$'\n'
for item in `find $1/ -type f`
do
yyyymmdd=`mdls -name kMDItemContentCreationDate $item | cut -d" " -f3`
extension=`basename "$item" | cut -d"." -f2 | tr '[:upper:]' '[:lower:]'` 
yyyy=`echo $yyyymmdd | cut -d"-" -f1`
mm=`echo $yyyymmdd | cut -d"-" -f2`
dd=`echo $yyyymmdd | cut -d"-" -f3`

if [ $extension == 'mov' ] || [ $extension == 'mp4' ] || [ $extension == '3gp' ];
then
	folder=$yyyy/$mm/video	
else
	folder=$yyyy/$mm/$dd
fi	
mkdir -p $folder
cp -av $item $folder/
done
