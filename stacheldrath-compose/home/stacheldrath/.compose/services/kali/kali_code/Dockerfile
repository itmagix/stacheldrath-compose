FROM kalilinux/kali-rolling:latest

RUN apt update

#RUN apt install -y \
#    spiderfoot \
#    theharvester \
#    emailharvester \
#    nikto \
#    zmap \
#    nmap \
#    wpscan \
#    gobuster \
#    masscan \
#    recon-ng \
#    sherlock \
#    eyewitness \
#    dnsrecon \
#    tcpdump \
#    dirbuster \
#    legion \
#    dnsenum \
#    ffuf \
#    dirsearch \
#    dnschef \
#    snort \
#    wordlistraider \
#    wordlists && \
#    apt clean

RUN apt install -y wget git python3-venv

WORKDIR /app

RUN git clone https://github.com/Wh0am123/MCP-Kali-Server.git

RUN cd MCP-Kali-Server && \
    python3 -m venv .venv && \
    /app/MCP-Kali-Server/.venv/bin/python -m pip install --no-cache -r requirements.txt

RUN curl "https://opencode.ai/install" | bash

RUN apt autoremove -y git wget

ENTRYPOINT ["MCP-Kali-Server/.venv/bin/python", "kali_server.py", "--debug"]
