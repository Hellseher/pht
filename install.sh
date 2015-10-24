#! /bin/sh
# File          :  install.sh
# Created       :  Fri 16 Oct 2015 14:50:01
# Last Modified :  Sat 24 Oct 2015 13:27:17
# Maintainer    :  sharlatan, <sharlatanus@gmail.com>
# License       :  Same as Bash (GPL)
# Credits       : http://www.cyberciti.biz/faq/bash-loop-over-file/
#               : https://regex101.com/
#
#..:: Description ::..
# depends on realpath... try to replace for POSIX disiion
#
# 
LOCAL_BIN=$HOME/.local/bin
ABS_PATH_BIN=$(realpath $0 | grep -Po "(?:(\S)*)(tiny-toolbox)")/bin/*

if [[ ! -d ${LOCAL_BIN} ]]; then
    # recursive create ~/.local/bin path
    mkdir -p ${LOCAL_BIN}

fi
# force create symlink to ./bin/*
for bin in ${ABS_PATH_BIN}; do
    ln -sf $bin ${LOCAL_BIN}
done

