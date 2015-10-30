#! /bin/sh
# File          :  install.sh
# Created       :  Fri 16 Oct 2015 14:50:01
# Last Modified :  Fri 30 Oct 2015 01:00:08
# Maintainer    :  sharlatan, <sharlatanus@gmail.com>
# License       :  Same as Bash (GPL)
# Credits       : http://www.cyberciti.biz/faq/bash-loop-over-file/
#               : https://regex101.com/
#
#..:: Description ::..
# depends on realpath... try to replace for POSIX disiion
# TODO export ./local/bin to $PATH if NOT
# 


LOCAL_BIN="$HOME/.local/bin"
ABS_PATH="$(readlink -f $0 | grep -Po "(?:(\S)*)(tiny-toolbox)")/bin/*"

err() {
      echo "[$(date +'%Y-%m-%dT%H:%M:%S%z')]: $@"
  }


# recursive create ~/.local/bin path
if [[ ! -d ${LOCAL_BIN} ]]; then
    mkdir -p ${LOCAL_BIN}
fi

# TODO (sharlatan): add to path corectly
# add to PATH if not
if [[ -z "$(echo $PATH | grep -Po "$(echo $HOME)\/\.local\/bin")" ]]; then
    echo Add ${LOCAL_BIN} to your PATH
fi

# force create symlink to ./bin/*
for bin in ${ABS_PATH}; do
    ln -sf $bin ${LOCAL_BIN}
done
