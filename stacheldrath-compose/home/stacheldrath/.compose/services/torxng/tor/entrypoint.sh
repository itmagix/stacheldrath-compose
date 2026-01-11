#!/bin/sh
# Starting TOR network layer
echo "Starting TOR network layer"
tor -f /etc/tor/torrc

# TOR Connection IP Address
TOR_IP=$(proxychains -q curl -s ifconfig.co)
echo
echo "TOR connection established with IP address: $TOR_IP"
echo

