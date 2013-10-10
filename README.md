LinuxKernelConfig
=================

Kernel configuration for a linux-3.10.15 kernel

Added following options to "allnoconfig":
* Initial RAM filesystem and RAM disk support
* ELF binaries support

-----------------

### Questions ###

* Ram-disk: Virtual temporary disk in RAM.

#### Linux specific ####

* Ramdisk: Older "ram disk" mechanism. Unnecessarily copying memory to cache, needs fs-driver, ...
* Ramfs: Simple filesystem that exports Linux's disk caching mechanisms.
* Tmpfs: Based on ramfs. Ability to write the data to swap space, add size limits, ...
