FROM python:trixie

WORKDIR /app

RUN git clone https://github.com/Wh0am123/MCP-Kali-Server.git

RUN cd MCP-Kali-Server && \
    python3 -m venv .venv && \
    /app/MCP-Kali-Server/.venv/bin/python -m pip install --no-cache -r requirements.txt

ENTRYPOINT ["MCP-Kali-server/.venv/bin/python", "mcp_server.py", "--server", "http://kali:5000", "--timeout", "3600"]
