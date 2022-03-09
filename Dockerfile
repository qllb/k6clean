FROM python:3.8-slim-buster

WORKDIR /app


RUN  apt-get update \
  && apt-get install -y --no-install-recommends jq git \
  && pip3 install pyasn1==0.4.6 \
  && git clone https://github.com/MHProDev/MHDDoS.git . \
  && pip3 install -r requirements.txt  \

COPY runner.sh proxies.txt ./

RUN mv proxies.txt files/proxies/0 \
    && chmod a+x /app/runner.sh

ENTRYPOINT /app/runner.sh