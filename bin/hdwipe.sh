#! /bin/sh
# File          :  wipe_disk.sh
# Created       :  Tue 24 Nov 2015 23:52:42
# Last Modified :  Thu 26 Nov 2015 21:51:01
# Maintainer    :  sharlatan, <sharlatanus@gmail.com>
# License       :  Same as Bash (GPL)
# Credits:
#
#..:: Description ::..
# Securely wipe the disk.
#
if [[ $UID -ne 0 ]]; then
    echo Run as root
fi

DISK=$1
DISK_SIZE=$(blockdev --getsize64 ${DISK})
ERASER=$(dd if=/dev/urandom bs=128 count=1 2>/dev/null | base64)

# Accidentals erase protection.
echo Disk ${DISK} will be complitely wiped [y/N].
read answer
if [[ "$answer" == "" ]]; then
    exit 0
fi
# --[ main
openssl enc -aes-256-ctr -pass pass:"${ERASER}" -nosalt </dev/zero \
        | pv -bartpes ${DISK_SIZE} \
        | dd bs=64K of=${DISK}
