#!/bin/bash
#@Author: zhsh9

# Start xquartz.
echo '[+] open -a XQuartz'
open -a XQuartz
echo -e "\033[32m[*] Success start XQuartz!\033[0m" # INFO

# Start socat LISTEN.
echo '[+] socat TCP-LISTEN:6000,reuseaddr,fork UNIX-CLIENT:\"$DISPLAY\" &'
socat TCP-LISTEN:6000,reuseaddr,fork UNIX-CLIENT:\"$DISPLAY\" &
echo -e '\033[32m[*] Success start socat!\033[0m' # INFO

# Start exegol
exegol start
