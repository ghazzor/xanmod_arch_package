# Maintainer: ghazzor <kartikhis8o@gmail.com>
pkgname=linux-xanmod-omen16-bin
pkgver=6.12  # Replace with your kernel version
pkgrel=1
pkgdesc='Pre-compiled Xanmod kernel with custom optimizations'
arch=('x86_64')
url="https://xanmod.org"
license=('GPL2')
depends=('coreutils' 'kmod' 'mkinitcpio')
optdepends=('linux-firmware: firmware for drivers'
            'grub: bootloader integration')
install=linux-xanmod-omen16-bin.install
# Source is the local linux directory
#source=("file://linux")
#sha256sums=('SKIP')  # Skip checksums for local files

package() {
  cd ../linux

  # Extract kernel version (if source tree exists)
  kernelver=$(make kernelversion)
  # OR hardcode it if source is missing:
  export kver="${kernelver}-x64v3-xanmod1"
  # Install modules
  mkdir -p "${pkgdir}/usr/lib/modules"
  #cp -r "out/lib/modules/$kver" "${pkgdir}/usr/lib/modules/"
  make INSTALL_MOD_PATH="${pkgdir}/usr" INSTALL_MOD_STRIP=1 modules_install
  rm -rf "${pkgdir}/usr/lib/modules/$kver/build"
  # Install kernel image
  install -Dm644 "arch/x86_64/boot/bzImage" "${pkgdir}/boot/vmlinuz-${kver}"

  # Install System.map
  install -Dm644 "System.map" "${pkgdir}/boot/System.map-${kver}"

  # Generate initramfs (optional: omit if not portable)

  # Fix module dependencies
#   depmod -b "${pkgdir}/usr" -F "System.map" "${kver}"
}
