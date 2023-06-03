#!/bin/bash
#@Author: zhsh9

# SOCAT_PORT config.
SOCAT_PORT=6000

# Start xquartz.
echo '[+] open -a XQuartz'
open -a XQuartz
echo -e "\033[32m[*] Success start XQuartz!\033[0m" # INFO

# Start socat LISTEN.
echo -e "[+] socat TCP-LISTEN:$SOCAT_PORT,reuseaddr,fork UNIX-CLIENT:\"$DISPLAY\" &"
socat TCP-LISTEN:$SOCAT_PORT,reuseaddr,fork UNIX-CLIENT:\"$DISPLAY\" &
echo -e '\033[32m[*] Success start socat!\033[0m' # INFO

# Start exegol
exegol start
