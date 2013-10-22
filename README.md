LinuxKernelConfig
=================

### Kernel configuration ###

Kernel configuration for a linux-3.10.15 kernel

Added following options to "allnoconfig":
* Initial RAM filesystem and RAM disk support
* ELF binaries support
* TMPFS support

### How-To ###

How to compile and run (with qemu) the linux kernel.

* Download 3.10 Linux Kernel, the 3.10.15 patch and extract it.
* patch -p1 "patchfile" in Linux Kernel directory.
* Rename kernel folder to version 3.10.15.
* ARCH=x86 make allnoconfig.
* ARCH=x86 make menuconfig.
* Enable the options specified on top of this article.
* Edit Makefile for ccache.
* Run compile script to compile kernel.
* Run emulate script for qemu.

Kernel uses busybox init program to start /etc/init.d/rcS to mount several directories.
It uses the configuration from /etc/inittab. To populate the /dev directory "mdev -s" is used.

### Questions ###

**BUILD** arch/x86/boot/bzImage  
Setup is 15068 bytes (padded to 15360 bytes).  
System is 1687 kB  
CRC 44b51156  

**clean**  
Remove most generated files but keep the config and enough build support to build external modules

**mrproper**  
Remove all generated files + config + various backup files

**distclean**  
mrproper + remove editor backup and patch files

For console output /dev/console is required.

If there is no init process (PID 1) -> kernel panic

**dmesg**  
prints kernel log to console.

**process count (ps)**  
20

**/tmp after reboot**  
files are gone. FS reinitialized.

**provided Emulator space**  
130MB

**needed space to boot**  
23MB

### Information about RAM-disks and RAM-FS ###

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

There are several ways to include a initfs. The most flexible way (no root required)
is to use a configuration file. Other ways are external cpio archives/directories/files.
(The kernel creates the archive automatically). For non-GPL programs external cpio is required.
