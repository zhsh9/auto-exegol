#!/bin/bash
#@Author: zhsh9

# Stop XQuartz
echo '[*] Check existence of XQuartz...' # INFO
if ps aux | grep -v grep | grep -q XQuartz ;
then
    ## if on.
    echo '[*] XQuartz is on:' # INFO
    echo "[+] ps aux | grep XQuartz | grep -v grep | awk \'{print \$2}\' | xargs kill -15" # INFO
    ps aux | grep XQuartz | grep -v grep | awk '{print $2}' | xargs kill -15

    echo -e '\033[32m[*] Success close XQuartz!\033[0m' # INFO
else
    ## if off.
    echo -e '\033[31m[!] XQuartz is off!\033[0m' # INFO
fi

# Kill process of socat.
echo '[*] Check existence of socat process...' # INFO
if ps aux | grep -v grep | grep -q socat ;
then
    ## if on.
    echo '[*] socat process is on:' # INFO
    ps aux | grep socat | grep LISTEN | awk '{print $1,$2,$12}' | grep -oE '^[^ ]+|[0-9]+|TCP-LISTEN:[0-9]+' | tr '\n' ' ' | awk '{print "[+] USER:", $1, "\n[+] PID :", $2, "\n[+] STAT:", $3}' # INFO
    ## terminate process.
    echo "[+] ps aux | grep socat | grep LISTEN | awk \'{print \$2}\' | xargs kill -9" # INFO
    ps aux | grep socat | grep LISTEN | awk '{print $2}' | xargs kill -9

    echo -e '\033[32m[*] Success close socat!\033[0m' # INFO
else
    ## if off.
    echo -e '\033[31m[!] socat process is off!\033[0m' # INFO
fi

# Stop exegol container.
exegol stop
