#! /bin/sh
# File          :  renamer.sh
# Created       :  Fri 03 Jul 2015 06:40:35
# Last Modified :  Fri 03 Jul 2015 07:30:31
# Maintainer    :  sharlaran, <sharlatanus@gmail.com>
# License       :  Same as Bash (GPL)
# Credits:
#
#..:: Description ::..
# Add extra digits to the beginning of the files if needed. 


FILES=$(ls)
NUM="^[0-9]+$"


for f in ${FILES}; do
    if [[ -e $f ]]; then
        # check whether $f is a file 
        # and extract num part of the name
        fs=$(echo $f | cut -d"-" -f 1)

        if [[ $fs =~ ${NUM} ]]; then
            if [[ ${#fs} -lt 3 ]]; then

                case ${#fs} in
                # add to valid files with extra zeros
                    1 ) mv $f ./00$f
                        ;;
                    2 ) mv $f ./0$f
                        ;;
                esac
            fi
        fi
    fi
done
