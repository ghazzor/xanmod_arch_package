#!/bin/bash

source build.conf

kver="$(make kernelversion)-64${ver}-xanmod1"
sudo make INSTALL_MOD_STRIP=1 modules_install
sudo cp  arch/x86_64/boot/bzImage /boot/vmlinuz-${kver}
sudo cp System.map /boot/System.map-${kver}
sudo mkinitcpio -k ${kver} -g /boot/initramfs-${kver}.img
