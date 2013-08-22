#!/bin/bash
set -e

KEHU_FILE=kehu_ruikemei

echo "*************"
echo "rm logo_linux_clut224"
echo "*************"
find drivers/video/logo/ -name logo_linux_clut224.o -exec rm -f {} \;
find drivers/video/logo/ -name logo_linux_clut224.c -exec rm -f {} \;
find drivers/video/logo/ -name logo_linux_clut224.ppm -exec rm -f {} \;

echo "***********************"
echo "copy logo_linux_clut224.ppm"
echo "***********************"
cp $KEHU_FILE/logo_linux_clut224.ppm drivers/video/logo/

echo "***********************"
echo "make kernel.img"
echo "***********************"
make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- kernel.img -j4

