# 一键dump系统源码到本地dex文件



>   Android中各种dex格式转换dump device framework code



1.   导出: adb pull /system/framework framework/
2.   `vdex`转``cdex`:  ./vdexExtractor -i framework/am.vdex  -o x/
2.   `cdex`转`dex`:./cdexExtract/bin/compact_dex_converter -w x x/am_classes.cdex



*   cdexExtract:
*   vdexExtractor: https://github.com/anestisb/vdexExtractor.git
