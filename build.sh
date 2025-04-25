#!/bin/bash
if [ -z $ver ]; then
    export ver='v3' # default is v3
fi

echo "ver=$ver" > build.conf
# get ur config and paste it as .config
# cp CONFIGS/xanmod/gcc/config_x86-64-${ver} arch/x86/configs/config_x86-64-${ver}_defconfig
# make LLVM=1 LLVM_IAS=1 config_x86-64-${ver}_defconfig
# make LLVM=1 LLVM_IAS=1 LSMOD=$HOME/.config/modprobed.db localmodconfig
# make LLVM=1 LLVM_IAS=1 xconfig
SECONDS=0
make LLVM=1 LLVM_IAS=1 KCFLAGS=-O3 LDFLAGS=--lto-O3 -j$(nproc --all)
echo -e "\nCompleted in $((SECONDS / 60))m $((SECONDS % 60))s"
