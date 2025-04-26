## instructions
do `make INSTALL_MOD_STRIP=1 dir-pkg` in kernel source, place the PKGBUILD above the kernel source dir

this is what it should look like
```bash
$ ls
PKGBUILD linux
```
make sure to either have the kernel source in linux dir or edit the `kernel_src_dir` variable in PKGBUILD for the dir name.
