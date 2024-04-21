#!/bin/bash

# Define a list of hostnames with eu keyboard layout
hostnames=("timo-ms7d96" "example-host1" "example-host2")

# Get the hostname
hostname=$(hostname)

# Check if the current hostname is in the list
if [[ " ${hostnames[@]} " =~ " ${hostname} " ]]; then
    # Execute setxkbmap eu
    setxkbmap eu
    echo "Keyboard layout set to 'eu' for hostname: $hostname"
else
    echo "Hostname $hostname does not match any in the list. No action taken."
fi

