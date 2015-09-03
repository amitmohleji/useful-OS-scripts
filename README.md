To view the top level packages so you can decide what to remove : jar -tvf com.microsoft.tfs.sdk-11.0.0.jar |cut -c37-200 | cut -d/ -f1,2 | uniq

To remove classes from jar :  zip com.microsoft.tfs.sdk-11.0.0.jar -d `jar -tvf com.microsoft.tfs.sdk-11.0.0.jar |grep org/apache |cut -c 37-200`
