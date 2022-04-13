framework_dex_dir="framework"
convert_temp_dir="convert_temp_dir"

if [ -d $framework_dex_dir ]; then
    echo 移除旧framework
    rm -rf $framework_dex_dir
fi

if [ -d $convert_temp_dir ]; then
    echo 删除临时目录
    rm -rf $convert_temp_dir
fi

echo "===============将 设备中的framework dex 拷贝到本地 ==========="
adb pull /system/framework $framework_dex_dir

mkdir $convert_temp_dir


files=`find "$framework_dex_dir" -name "*.vdex" -o -name "*.ovdex"`
echo "============从 vdex 中提取 dex: find $framework_dex_dir -name *.vdex -o -name *.ovdex==========="

for file in $files
do
	echo "vdex->cdex: $file"
	./vdexExtractor -i "$file" -o $convert_temp_dir
	# echo "单句: ./vdexExtractor -i "$file" -o $convert_temp_dir"
done

echo "===============将 cdex 转为标准的 dex==========="
cdex_files=`find "$convert_temp_dir" -name "*.cdex"`
for cdex_file in $cdex_files
do
	echo "cdex->dex: $cdex_file"
	./cdexExtract/bin/compact_dex_converter -w $convert_temp_dir $cdex_file
done

echo "===============重命名 cdex 转换文件名=========="
cdex_out_files=`find . -name "*.cdex"`
for cdex_out_file in $cdex_out_files
do 
	echo $cdex_out_file
	fileName=$(basename "$cdex_out_file" .cdex)
	mv "$convert_temp_dir/$fileName.cdex" "$convert_temp_dir/$fileName.dex"
done

echo "===================dex 转 java==================="
files=`find "$convert_temp_dir" -name "*.dex"`
for file in $files
do
	
	./jadx/bin/jadx -d code --show-bad-code $file
done