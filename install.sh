#! /bin/sh
# File          :  install.sh
# Created       :  Fri 16 Oct 2015 14:50:01
# Last Modified :  Thu 29 Oct 2015 23:31:47
# Maintainer    :  sharlatan, <sharlatanus@gmail.com>
# License       :  Same as Bash (GPL)
# Credits       : http://www.cyberciti.biz/faq/bash-loop-over-file/
#               : https://regex101.com/
#
#..:: Description ::..
# depends on realpath... try to replace for POSIX disiion
# TODO export ./local/bin to $PATH if NOT
# 
LOCAL_BIN=$HOME/.local/bin
ABS_PATH=$(readlink -f $0 | grep -Po "(?:(\S)*)(tiny-toolbox)")/bin/*

err() {
      echo "[$(date +'%Y-%m-%dT%H:%M:%S%z')]: $@" >&2
  }


if [[ ! -d ${LOCAL_BIN} ]]; then
    # recursive create ~/.local/bin path
    mkdir -p ${LOCAL_BIN}

fi
# force create symlink to ./bin/*
for bin in ${ABS_PATH}; do
    ln -sf $bin ${LOCAL_BIN}
done

