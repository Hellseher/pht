#! /bin/sh
# File          :  group_pull.sh
# Created       :  Sun 31 May 2015 22:27:43
# Last Modified :  Tue 16 Jun 2015 00:00:56
# Maintainer    :  sharlatan, <sharlatanus@gmail.com>
# License       :  Same as Bash (GPL)
# Credits:
#
# -=:[ DESCRIPTION ]:=-
# Update git from all project .
# <END OF DESCRIPTION>---------------------------------------------------------


DIR_LIST=$(ls -d */)

BOLD="\e[1m"
GREEN="\033[33m"
NC="\033[0m"

for dir in $DIR_LIST; do
    echo -en "${BOLD}$dir${NC}\t\t"\\r
    cd $dir
    git pull &&
    echo -e "\t\t\t\t\t\t\t\t\t[${GREEN}+${NC}]"
    cd ..
done

# Wed 10 Jun 2015 09:49:07 
# TODO : add log of updates
#      : add redirection to git.log
