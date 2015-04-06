#!/bin/bash

# watermark.sh
# 24.10.2014

#     Take logo(s) from command line and put evry of them to all pictures found
# in current dirrectory. 
#    Think about how to take paramaters up-side, not for only one logo (2-n)
#     Script hase to take in count the size of the logo (LxH), calculate the
# space between the logos, if they are many. Read more about ImgeMagick, I think
# can be extracted from them (LxH). I need only logo width and logo gap. Add
# resolution changes from command line arg.

#     Used in this script
# Packet from ImageMagic: >composite< to put one image on another
#             : >identify< to extract information about img parm


LOGO=$1
LOGO_ME=$2
LOCATION="with_logos"
LOGO_W=100
GAP=100


if [ -f '/usr/bin/composite' ]; then
    echo ok, you have ImageMagick!
else
    echo "install ImageMagick packages."
fi

if [ $# -ne 2 ]; then
    echo usage: $0 logo.png logo_me.png 
    exit 1
fi

pwd
echo

echo This scrip will apply for all *.jpg files in courrent directory.
echo Are you sure \[y\\n\]?
read $ANSWER

if [ $ANSWER = n ]; then
    exit 0
fi

if [ -d $LOCATION ]; then
    rm -rf ${LOCATION}
fi

mkdir ${LOCATION}
mkdir tmp_logo

for imgs in *.jpg; do
    composite -gravity SouthWest -geometry +${GAP}+${GAP} ${LOGO} $imgs \
        tmp_logo/$imgs && \
    composite -gravity SouthEast -geometry +${GAP}+${GAP} ${LOGO_ME} tmp_logo/$imgs \
        ${LOCATION}/$imgs
done
rm -rf tmp_logo
