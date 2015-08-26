#! /bin/sh
# File          :  usage.sh
# Created       :  Wed 26 Aug 2015 22:42:43
# Last Modified :  Wed 26 Aug 2015 22:43:13
# Maintainer    :  sharlatan, <sharlatanus@gmail.com>
# License       :  Same as Bash (GPL)
# Credits:
#
#..:: Description ::..
# Template of "usage" menue for *.sh scripts
# 
usage() {
    echo "Usage: `basename $0` <course>"
    echo "       `basename $0` [options]"
    echo "    --distro               List current Linux distro"
    echo "    --install              Install missing packages for the course"
    echo "    --list                 List all supported courses"
    echo "    --no-course-materials  Don't install course materials"
    echo "    --no-install           Don't check installed packages"
    echo "    --no-recommends        Don't install recommended packages"
    echo "    --update               Update to latest version of this script"
    echo "    --verify               Verify script MD5sum"
    echo "    --version              List script version"
    echo "    --verbose              Turn on extra messages"
    echo
    echo "Example: `basename $0` --install LFD411"
    exit 0
}
