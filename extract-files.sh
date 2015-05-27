#!/bin/sh

VENDOR=huawei
DEVICE=mt2

BASE=../../../vendor/$VENDOR/$DEVICE/proprietary
rm -rf $BASE/*

for FILE in $(cat device-proprietary-files.txt | grep -v '^#' | grep -v '^$'); do
    mkdir -p $BASE/$(dirname $FILE)
    adb pull /system/$FILE $BASE/$FILE
done

./setup-makefiles.sh
