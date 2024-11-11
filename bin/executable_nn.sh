#!/bin/bash
OWNER="$(ls -la $1 | awk '{print $3}')"
#echo "$1" | tee /dev/tty | xsel -b
[[ $OWNER != $USER ]] && sudo nano" $1" || nano "$1"
