FROM python:3.8-slim-buster

WORKDIR /app

COPY . .

RUN  apt-get update \
  && apt-get install -y --no-install-recommends jq \
  && pip3 install pyasn1==0.4.6 \
  && git clone https://github.com/MHProDev/MHDDoS.git \
  && cd MHDDoS \
  && pip3 install -r requirements.txt \
  && cp /app/proxies.txt files/proxies/0 \
  && chmod a+x /app/runner.sh

ENTRYPOINT runner.sh