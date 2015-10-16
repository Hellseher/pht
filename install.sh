#! /bin/sh
# File          :  install.sh
# Created       :  Fri 16 Oct 2015 14:50:01
# Last Modified :  Fri 16 Oct 2015 14:56:24
# Maintainer    :  sharlatan, <sharlatanus@gmail.com>
# License       :  Same as Bash (GPL)
#
#..:: Description ::..
#
# 
LOCAL_BIN=$HOME/.local/bin

if [[ ! -d ${LOCAL_BIN} ]]; then
    mkdir -p ${LOCAL_BIN}
    ln -s $(ls ./bin) ${LOCAL_BIN}
fi

