#!/usr/bin/env bash

# encryption stage does not rerun after elf is recompiled
rm .pio/build/chitu_f103/firmware.*
pio run -e chitu_f103

[ -e /dev/mmcblk0p1 ] && {

    udisksctl mount -b /dev/mmcblk0p1
    md5sum .pio/build/chitu_f103/update.cbd
    cp .pio/build/chitu_f103/update.cbd /run/media/$USER/disk/
    md5sum /run/media/$USER/disk/update.cbd
    udisksctl unmount -b /dev/mmcblk0p1

}
