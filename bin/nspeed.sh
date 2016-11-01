#! /bin/sh
# File          :  nspeed.sh
# Created       :  Wed 25 Nov 2015 20:22:30
# Last Modified :  Wed 25 Nov 2015 21:42:14
# Maintainer    :  sharlatan, <sharlatanus@gmail.com>
# License       :  Same as Bash (GPL)
# Credits:
#
#..:: Description ::..
# Show the speed throught the interface.
if [[ $# -ne 1 ]]; then
    echo $#
    exit 0
fi
magnitude () {

    local Kbyt=1024
    local Mbyt=1048576

    local differance=$(( before - after ))
    local
    echo $(( $1 - $2 ))
}

magnitude 1234 234234
# iface=$1
# # show the net speed
# while true; do
# RXB=$(</sys/class/net/"$iface"/statistics/rx_bytes)
# TXB=$(</sys/class/net/"$iface"/statistics/tx_bytes)
# 
# sleep 1
# 
# RXBN=$(</sys/class/net/"$iface"/statistics/rx_bytes)
# TXBN=$(</sys/class/net/"$iface"/statistics/tx_bytes)
# RXDIF=$(echo $((RXBN - RXB)) )
# TXDIF=$(echo $((TXBN - TXB)) )
# 
# echo -ne "\r$((RXDIF / 1024 / 2))K/s $((TXDIF / 1024 / 2))K/s  "
# 
# done
