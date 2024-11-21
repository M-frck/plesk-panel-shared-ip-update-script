#!/bin/bash
# Author: mFrck
# Description: Fetch the new public IP and Reread for Plesk Panel
# License: MIT License
# change to bin/sh when necessary

NEW_PUBLIC_IP=$(curl -s http://checkip.amazonaws.com)

# Retrieve current shared IP in Plesk
CURRENT_SHARED_IP=$(plesk bin ipmanage --ip_list | grep -E '^[0-9]+\.\d+\.\d+\.\d+' | awk '{print $1; exit}')

# Validate new IP format
if [[ ! $NEW_PUBLIC_IP =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
    echo "Invalid IP format detected. Exiting."
    exit 1
fi

# Check if the public IP has changed
if [ "$NEW_PUBLIC_IP" != "$CURRENT_SHARED_IP" ]; then
    echo "Updating Plesk shared IP from $CURRENT_SHARED_IP to $NEW_PUBLIC_IP"
    
    # Update shared IP directly
    #plesk bin ipmanage --update "$CURRENT_SHARED_IP" -public_ip "$NEW_PUBLIC_IP" -type shared
                 #Change ip with your LOCAL IP SERVER#
   sudo plesk bin ipmanage -u 192.168.1.1  -public_ip "$NEW_PUBLIC_IP"

    # Reread IPs to apply changes
   sudo plesk bin ipmanage --reread
else
    echo "No change in IP detected."
fi
