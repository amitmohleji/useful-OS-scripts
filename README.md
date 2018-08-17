## Handy Shell Snippets ##

### To view the top level packages so you can decide what to remove ### 

```
jar -tvf com.microsoft.tfs.sdk-11.0.0.jar |cut -c37-200 | cut -d/ -f1,2 | uniq
```

### To fnd all the unique file extensions in a folder hierachy ###

```
find Pictures/Photos\ Library.photoslibrary/Masters/ -type f -exec basename {} \; | cut -d"." -f2 |tr '[:upper:]' '[:lower:]' | sort |uniq
```


### To remove classes from jar ###

```
zip com.microsoft.tfs.sdk-11.0.0.jar -d `jar -tvf com.microsoft.tfs.sdk-11.0.0.jar |grep org/apache |cut -c 37-200`
```

### replace  ${abc}  with {{abc}}  anywhere in the file using sed ###

```
sed -i '' 's/\${\([^}]*\)}/{{\1}}/g'
```

### replace ${ABC_XYZ}  with {{ABC_XYZ}}  anywhere in the file only with caps and underscores ###

```
sed -i '' 's/\${\([A-Z_^}]*\)}/{{\1}}/g'
```


