#!/bin/bash
echo "Enter the first three octets of your IP (e.g., 192.168.1): "
read mask
echo ""
for i in {0..254}; do
    (
    if ping -c 1 -W 1 "$mask.$i" | grep -q ttl; then
        echo "$mask.$i is alive"
    fi 
    ) &
done

wait
