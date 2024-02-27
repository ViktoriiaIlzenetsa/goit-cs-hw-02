#!/bin/bash

websites=(https://google.com https://facebook.com https://twitter.com)

logfile="website_status.log"

>"$logfile"

for item in "${websites[@]}"
do
    if curl -s -L --head --request GET -w "%{http_code}" "$item" | grep "200" > /dev/null
    then
        echo "$item is UP" >> "$logfile"
    else
        echo "$item is DOWN" >> "$logfile"
    fi
done

echo "Program is completed. Results are written to $logfile"
