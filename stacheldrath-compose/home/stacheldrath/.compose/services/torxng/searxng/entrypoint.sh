#!/bin/sh
# Validating TOR connection
echo "Validating TOR connection"
TOR_IP=$(proxychains4 -q curl -s ifconfig.co)
echo "Connection to TOR network with IP: $TOR_IP"
sleep 3

# Starting TorXNG
echo "Starting TorXNG Anonymous Search"
cd /usr/local/searxng/searxng-src

export PATH="/usr/local/searxng/searxng-src/bin:$PATH"
venv/bin/python searx/webapp.py 2>&1

