FROM kalilinux/kali-rolling:latest

RUN apt update

RUN apt install -y curl git python3-venv

WORKDIR /app

RUN git clone https://github.com/Wh0am123/MCP-Kali-Server.git

RUN cd MCP-Kali-Server && \
    python3 -m venv .venv && \
    /app/MCP-Kali-Server/.venv/bin/python -m pip install --no-cache -r requirements.txt

RUN curl -fsSL https://opencode.ai/install | bash

RUN apt autoremove -y git curl

CMD ["MCP-Kali-Server/.venv/bin/python", "MCP-Kali-Server/kali_server.py", "--debug"]
