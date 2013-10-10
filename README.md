LinuxKernelConfig
=================

Kernel configuration for a linux-3.10.15 kernel

Added following options to "allnoconfig":
* Initial RAM filesystem and RAM disk support
* ELF binaries support

-----------------

### How-To ###

Download 3.10 Linux Kernel and the 3.10.15 patch extract it.
patch -p1 patchfile in Linux Kernel directory.
Rename folder.
ARCH=x86 make allnoconfig.
ARCH=x86 make menuconfig.
Edit Makefile fpr ccache.
ARCH=x86 make -j 4.

### Questions ###

#### RAM-disks ####

* Ram-disk: Virtual temporary disk in RAM.

##### Linux specific #####

* Ramdisk: Older "ram disk" mechanism. Unnecessarily copying memory to cache, needs fs-driver, ...
* Ramfs: Simple filesystem that exports Linux's disk caching mechanisms.
* Tmpfs: Based on ramfs. Ability to write the data to swap space, add size limits, ...
* Rootfs: Is a special instance of ramfs. Is always present.

> All 2.6 Linux kernels contain a gzipped "cpio" format archive, which is
extracted into rootfs when the kernel boots up.  After extracting, the kernel
checks to see if rootfs contains a file "init", and if so it executes it as PID
1.  If found, this init process is responsible for bringing the system the
rest of the way up, including locating and mounting the real root device (if
any).

Source:
https://www.kernel.org/doc/Documentation/filesystems/ramfs-rootfs-initramfs.txt
