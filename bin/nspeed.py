#! /usr/bin/env python
# _*_ coding: UTF-8 _*_
# File          :  nspeed.py
# Created       :  Wed 25 Nov 2015 21:44:50
# Last Modified :  Wed 25 Nov 2015 22:43:21
# Maintainer    :  sharlatan, <sharlatanus@gmail.com>
# Title         :
# License       :  Same as Python (GPL)
# Credits       :
#
# -=:[ Description ]:=-
#
# <END  OF  DESCRIPTION>-------------------------------------------------------

import time


def with_open_file(fin):
    with open(fin, 'r') as f:
        data = f.read()
        return data


def mag(before, after):
    ''' Speed magnitude converter '''
    raw_speed = int(before) - int(after)

    if raw_speed / 1024 != 0:
        return str(raw_speed / 1024) + "KB/s   "
    elif raw_speed / 1048576 != 0:
        return str(raw_speed / 1048576) + "MB/s   "
    return str(raw_speed) + "B/s   "


def main():
    while True:
        rxb = with_open_file("/sys/class/net/enp2s0/statistics/rx_bytes")
        txb = with_open_file("/sys/class/net/enp2s0/statistics/tx_bytes")

        time.sleep(1)

        rxbn = with_open_file("/sys/class/net/enp2s0/statistics/rx_bytes")
        txbn = with_open_file("/sys/class/net/enp2s0/statistics/tx_bytes")

        print "\r", mag(rxbn, rxb), mag(txbn, txb),


if __name__ == "__main__":
    main()
