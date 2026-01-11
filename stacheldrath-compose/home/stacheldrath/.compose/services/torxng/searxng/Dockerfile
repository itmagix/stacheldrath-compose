FROM debian:trixie-slim

# Enable Apt repository channels
RUN echo "deb http://ftp.nl.debian.org/debian bookworm main contrib non-free non-free-firmware" echo > /etc/apt/sources.list
RUN echo "deb http://ftp.nl.debian.org/debian bookworm main contrib non-free non-free-firmware" echo >> /etc/apt/sources.list

# Update package repository
RUN apt update

# Install required packages
RUN apt install -y \
    python3-dev python3-pip python3-babel python3-venv python-is-python3 wget curl \
    uwsgi uwsgi-plugin-python3 git build-essential libxslt-dev zlib1g-dev libffi-dev libssl-dev

# Install proxychains for TOR connection validation
RUN apt install -y \
    proxychains4

# Clean up cached files
RUN rm -rf /var/cache/apt/archives/*

# Clean up unused packages
RUN apt autoremove -y

# Copy default Proxychains4 configuration
COPY ./proxychains.conf /etc/proxychains.conf

# Create SearXNG user
RUN useradd --shell /bin/bash --system \
    --home-dir "/usr/local/searxng" \
    --comment 'Privacy-respecting metasearch engine' \
    searxng 

# Create SearXNG bin directory
RUN mkdir "/usr/local/searxng"

# Set SearXNG permission on directory
RUN chown -R "searxng:searxng" "/usr/local/searxng"

# Get SearXNG source
RUN git clone "https://github.com/searxng/searxng" "/usr/local/searxng/searxng-src"

# Set Workdir
WORKDIR "/usr/local/searxng/searxng-src"

# Create SearXNG configuration directory
RUN mkdir -p "/etc/searxng"

# Copy SearXNG configuration
COPY ./settings.yml /etc/searxng/settings.yml
COPY ./limiter.toml /etc/searxng/limiter.toml

# Copy container entrypoint script
COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Set user permissions
RUN chown -R searxng:searxng /usr/local/searxng

# Switch to SearXNG user
USER searxng

# Install required Python packages
RUN python3 -m venv venv

ENV PATH="/usr/local/searxng/searxng-src/bin:$PATH"

RUN ./venv/bin/python -m pip install --no-cache --upgrade pip setuptools wheel pyyaml msgspec 
RUN ./venv/bin/python -m pip install --no-cache --use-pep517 --no-build-isolation -e .

# Expose port
EXPOSE 1337

# Start services in container
ENTRYPOINT ["/entrypoint.sh"]
