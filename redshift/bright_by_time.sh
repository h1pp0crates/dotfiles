#!/bin/bash

set_bright() {
    brightnessctl -q set "$1%"
}

hour=$((10#$(date "+%H")))

case $hour in
0 | 1 | 2 | 3 | 4) set_bright 30 ;;
5 | 23) set_bright 40 ;;
6 | 22) set_bright 50 ;;
7 | 21) set_bright 65 ;;
8 | 20) set_bright 70 ;;
9 | 19) set_bright 85 ;;
10 | 18) set_bright 95 ;;
*) set_bright 100 ;;
esac
