#! /bin/sh
# File          :  install.sh
# Created       :  Fri 16 Oct 2015 14:50:01
# Last Modified :  Fri 16 Oct 2015 17:03:39
# Maintainer    :  sharlatan, <sharlatanus@gmail.com>
# License       :  Same as Bash (GPL)
# Credits       : http://www.cyberciti.biz/faq/bash-loop-over-file/
#..:: Description ::..
# depends on realpath... try to replace for POSIX disiion
#
# 
LOCAL_BIN=$HOME/.local/bin
ABS_PATH_BIN=$(realpath $0 |  grep -Po "(?:(\S)*)(tiny-toolbox)")/bin/*

if [[ ! -d ${LOCAL_BIN} ]]; then
    # recurcivle create ~/.local/bin path
    mkdir -p ${LOCAL_BIN}

    for bin in ${ABS_PATH_BIN}; do
        ln -s $bin ${LOCAL_BIN}
        #statements
    done
fi

