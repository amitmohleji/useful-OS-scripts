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

### look at the status of all git repos in a folder ###

```
for item in `ls`; do echo $item ;cd $item; git status; cd ..; done
```

### networking  ifconfig loopback ###

https://stackoverflow.com/questions/22944631/how-to-get-the-ip-address-of-the-docker-host-from-inside-a-docker-container

On Docker for Mac the docker0 bridge does not exist, so other answers here may not work. All outgoing traffic however, is routed through your parent host, so as long as you try to connect to an IP it recognizes as itself (and the docker container doesn't think is itself) you should be able to connect. For example if you run this from the parent machine run:
ipconfig getifaddr en0
This should show you the IP of your Mac on its current network and your docker container should be able to connect to this address as well. This is of course a pain if this IP address ever changes, but you can add a custom loopback IP to your Mac that the container doesn't think is itself by doing something like this on the parent machine:

```
sudo ifconfig lo0 alias 192.168.46.49
```

You can then test the connection from within the docker container with telnet. In my case I wanted to connect to a remote xdebug server:
telnet 192.168.46.49 9000
Now when traffic comes into your Mac addressed for 192.168.46.49 (and all the traffic leaving your container does go through your Mac) your Mac will assume that IP is itself. When you are finish using this IP, you can remove the loopback alias like this:

```
sudo ifconfig lo0 -alias 192.168.46.49
```

