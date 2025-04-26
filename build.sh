#!/bin/bash
if [ -z $ver ]; then
    export ver='v3' # default is v3
fi

echo "ver=$ver" > build.conf
# cp CONFIGS/xanmod/gcc/config_x86-64-${ver} arch/x86/configs/config_x86-64-${ver}_defconfig
# make LLVM=1 LLVM_IAS=1 config_x86-64-${ver}_defconfig
# make LLVM=1 LLVM_IAS=1 LSMOD=$HOME/.config/modprobed.db localmodconfig
# make LLVM=1 LLVM_IAS=1 xconfig
# sed -i 's/KBUILD_CFLAGS += -O2/KBUILD_CFLAGS += -O3/' Makefile
# sed -i 's/KBUILD_RUSTFLAGS += -Copt-level=2/KBUILD_RUSTFLAGS += -Copt-level=3/'
SECONDS=0
make LLVM=1 LLVM_IAS=1 KCFLAGS=-O3 LDFLAGS=--lto-O3 INSTALL_MOD_STRIP=1 dir-pkg -j$(nproc --all)
echo -e "\nCompleted in $((SECONDS / 60))m $((SECONDS % 60))s"
