#!/bin/sh
#ctags -R
#./2.sh
#find ./ -name ProjectConfig.mk | xargs sed -i 's/AUTO_ADD_GLOBAL_DEFINE_BY_NAME/\/\/AUTO_ADD_GLOBAL_DEFINE_BY_NAME/g' 
find . -name "*.h" -o -name "*.c" -o -name "*.cpp" -o -name "*.java"  -o -name "*.mk"   -o -name "Makefile"  -o -name "makefile"  -o -name "*.py" -o -name "*.sh" -o -name "*.pl" -o -name "Kconfig" -o -name "Android.mk" -o -name "*.s" -o -name "*.S" > cscope.files
cscope -bkq -i cscope.files
echo -e "!_TAG_FILE_SORTED\t2\t/2=foldcase/" > filenametags
find . -not -regex '.*\.\(png\|gif\|o\)' -type f -printf "%f\t%p\t1\n" | \
    sort -f >> filenametags
#./1.sh
#find ./ -name ProjectConfig.mk | xargs sed -i 's/\/\/AUTO_ADD_GLOBAL_DEFINE_BY_NAME/AUTO_ADD_GLOBAL_DEFINE_BY_NAME/g' 
