#! /bin/sh
# File:           sres.sh
#
# Created:        Wed 18 Mar 2015 18:50:58
# Last Modified:  Wed 18 Mar 2015 19:24:51
# Maintainer:     sharlatan, <sharlatanus@gmail.com>
# License:        Same as Bash (GPL)
# Credits:
: '
-=[ Description
Sort images by resolution, create dirs on the fly.
'

for img in *.png; do
    res="$(identify $img 2>/dev/null| awk -F" " '{print $3}')"
    if [ ! -d $res ]; then
        mkdir $res
    fi
    if [[ -z "$res" ]]; then
        res="error"
    fi
    mv $img $res
done
