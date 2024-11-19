#!/bin/bash

# Check if an IP address is provided
if [ $# -eq 0 ]; then
    echo "Please provide an IP address as an argument."
    exit 1
fi

IP=$1

# Use ipinfo.io to get location information
RESPONSE=$(curl -s "https://ipinfo.io/${IP}/json")

# Extract the city from the response
if  [[ $IP = 91.65.198.98 ]]; then
  CITY=" HOME"
else
  CITY=$(echo $RESPONSE | jq -r '.city')
fi

if [ "$CITY" == "null" ] || [ -z "$CITY" ]; then
    echo "City information not available for IP: $IP"
else
#    echo "The city associated with IP $IP is: $CITY"
    echo "$CITY"
fi
