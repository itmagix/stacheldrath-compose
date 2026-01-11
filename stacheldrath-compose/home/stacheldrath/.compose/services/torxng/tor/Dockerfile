FROM debian:trixie-slim

# Enable Apt repository channels
RUN echo "deb http://ftp.nl.debian.org/debian bookworm main contrib non-free non-free-firmware" echo > /etc/apt/sources.list
RUN echo "deb http://ftp.nl.debian.org/debian bookworm main contrib non-free non-free-firmware" echo >> /etc/apt/sources.list

# Update package repository
RUN apt update

# Install required packages
RUN apt install -y \
    curl \
    libssl-dev

# Install TOR and ProxyChains
RUN apt install -y \
    tor \
    tor-geoipdb \
    proxychains4

# Clean up cached files
RUN rm -rf /var/cache/apt/archives/*

# Copy TOR configuration
COPY ./torrc /etc/tor/torrc
COPY ./torsocks.conf /etc/tor/torsocks.conf

# Copy container entrypoint script
COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Export port
EXPOSE 9050

# Start services in container
ENTRYPOINT ["/entrypoint.sh"]
