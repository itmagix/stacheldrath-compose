FROM python:3.12-trixie

WORKDIR /app

RUN git clone https://github.com/researchanddestroy/dorxng .

RUN python -m venv venv

ENV PATH="/app/venv/bin:$PATH"

RUN ./venv/bin/python -m pip install --no-cache --upgrade -r requirements.txt

RUN chmod +x ./DorXNG.py

RUN ./venv/bin/python ./DorXNG.py -h
