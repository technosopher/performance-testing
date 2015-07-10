#!/bin/bash
i=0
while true; do
if [[ $((i)) -gt 101 ]]; then
 exit
fi
pkill firefox
DISPLAY=:19 firefox --new-window "http://files.opentechinstitute.org/~mccarthy/ndt-javascript-client/test.html" &
sleep 40
./web100clt -n 23.228.128.165 --disablesfw --disablemid
sleep 5
i=$((i+1))
echo "$i tests run so far..."
done

