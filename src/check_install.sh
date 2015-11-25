#! /bin/sh
# File          :  check_install.sh
# Created       :  Fri 30 Oct 2015 00:09:25
# Last Modified :  Fri 30 Oct 2015 00:10:45
# Maintainer    :  sharlatan, <sharlatanus@gmail.com>
# License       :  Same as Bash (GPL)
# Credits:
#
#..:: Description ::..
#
# 
command -v foo >/dev/null 2>&1 || { echo >&2 "I require foo but it's not \
    installed.  Aborting."; exit 1; }

type foo >/dev/null 2>&1 || { echo >&2 "I \
require foo but it's not installed.  Aborting."; exit 1; } 

hash foo 2>/dev/null || { echo >&2 "I require foo but it's not installed.  Aborting."; exit 1; }
