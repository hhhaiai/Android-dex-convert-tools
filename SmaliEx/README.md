### About
* https://github.com/testwhat/SmaliEx

This is forked from https://github.com/JesusFreke/smali  
The additional modification is to support convert oat file to dex, and able to smali/baksmali multi-dex.

Function concept:  
boot.oat -> extract optimized boot class dex files -> deoptimize to dex files  
app.odex(oat) -> reference boot dex files to deoptimize

Download latest version:  
https://github.com/testwhat/SmaliEx/releases/tag/snapshot

Build command:  
gradlew -b smaliex/build.gradle dist

Usage:  
Deoptimize boot classes (The output will be in "odex" and "dex" folders):  
        java -jar oat2dex.jar boot <boot.oat file>  
Deoptimize application:  
        java -jar oat2dex.jar <app.odex> <boot-class-folder output from above>  
Get odex from oat:  
        java -jar oat2dex.jar odex <oat file>  
Get odex smali (with optimized opcode) from oat/odex:  
        java -jar oat2dex.jar smali <oat/odex file>  
Deodex /system/framework/ from device (need to connect with adb):  
        java -jar oat2dex.jar devfw

Limitation:  
- If debug infomration is trimmed (e.g. with android support library or proguarded), then it is unable to recover type information.
- Cannot recognize informal oat/dex format.

Used by:  
[JoelDroid](http://forum.xda-developers.com/android/software-hacking/script-app-joeldroid-lollipop-batch-t2980857)  
[SVADeodexerForArt](http://forum.xda-developers.com/galaxy-s5/general/tool-deodex-tool-android-l-t2972025)  
[PUMa - Patch Utility Manager](http://forum.xda-developers.com/showthread.php?t=1434946)