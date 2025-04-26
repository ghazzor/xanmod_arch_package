# Maintainer: ghazzor <kartikhis8o@gmail.com>
pkgname=linux-xanmod-omen16-bin
pkgver=6.12  # Replace with your kernel version
pkgrel=3
pkgdesc='Pre-compiled Xanmod kernel with custom optimizations'
arch=('x86_64')
url="https://xanmod.org"
license=('GPL2')
depends=('coreutils' 'kmod' 'mkinitcpio')
optdepends=('linux-firmware: firmware for drivers'
            'grub: bootloader integration')
touch xanmod.install
install=xanmod.install
kernel_src_dir=linux

package() {
  cd ../${kernel_src_dir}
  mkdir -p "${pkgdir}/usr/"
  cp -r "tar-install/lib/" "${pkgdir}/usr/"
  export kver=$(basename ${pkgdir}/usr/lib/modules/*xanmod1)
  cat << EOF > ../xanmod.install
post_install() {
  echo ">>> Generating initramfs for kernel: $KERNEL_VERSION"
  mkinitcpio -k $kver -g "/boot/initramfs-$kver.img"

  echo ">>> Updating GRUB configuration"
  grub-mkconfig -o /boot/grub/grub.cfg
}

  post_upgrade() {
  post_install
}

post_remove() {
  echo ">>> Removing initramfs and updating GRUB..."
  rm -f /boot/initramfs-$kver.img
  grub-mkconfig -o /boot/grub/grub.cfg
}
EOF
  cp -r "tar-install/boot" "${pkgdir}/"
  rm -rf "${pkgdir}/usr/lib/modules/$kver/build"
  rm -rf "${pkgdir}/boot/vmlinux-$kver"
}
