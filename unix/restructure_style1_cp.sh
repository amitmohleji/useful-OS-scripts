#!/bin/sh
IFS=$'\n'
for item in `find $1/ -type f`
do
yyyymmdd=`mdls -name kMDItemContentCreationDate $item | cut -d" " -f3`
#yyyymmdd=`mdls -name kMDItemContentModificationDate $item | cut -d" " -f3`
extension=`basename "$item" | rev | cut -d"." -f1 | rev | tr '[:upper:]' '[:lower:]'` 
filename=`basename "$item" | cut -d"." -f1` 
yyyy=`echo $yyyymmdd | cut -d"-" -f1`
mm=`echo $yyyymmdd | cut -d"-" -f2`
dd=`echo $yyyymmdd | cut -d"-" -f3`

if [ "$filename" != "" ];
	then
		if [ $extension == 'mov' ] || [ $extension == 'mp4' ] || [ $extension == '3gp' ] || [ $extension == 'avi' ];
		then
			folder=$yyyy/$mm/video	
		else
			folder=$yyyy/$mm/$dd
		fi	
		mkdir -p $folder
		cp -av $item $folder/
	fi
done
