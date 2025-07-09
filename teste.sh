#!/bin/bash

echo ""
echo "Select R to see the routes or I to see the network interface: "
read option

if [[ $option == "R" ]]; then
    route
elif [[ $option == "I" ]]; then
    echo "Enter a network interface name to see more details: "
    read interface
    if [[ -z $interface ]]; then #-z é serve para eu checar se o lenght de uma variável é diferente de zero
        echo "No interface name provided. Exiting..."
        exit 1
    fi
    if ! ifconfig $interface &>/dev/null; then
        echo "Error: Network interface '$interface' not found."
        exit 1
    fi
    echo "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"
    echo "SHOWING NETWORK INTERFACE: $interface"
    echo "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"
    ifconfig $interface
else
    echo "Invalid option selected. Please select 'R' or 'I'."
    exit 1
fi
