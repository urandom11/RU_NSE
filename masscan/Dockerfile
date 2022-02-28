FROM debian:10.1

#USER root

RUN apt update \
    && apt install -y libpcap-dev build-essential \
    git \
    libclang-dev \
    \
    && git clone --depth=1 \
    --branch=master \
    https://github.com/robertdavidgraham/masscan.git \
    && cd /masscan \
    && make \
    \
   # && apk del .deps \
    && rm -rf /var/cache/apk/*

RUN adduser --disabled-password --gecos "" scan \
    && setcap cap_net_raw=eip /masscan/bin/masscan

USER scan

VOLUME /home/scan
WORKDIR /home/scan
ENTRYPOINT ["/masscan/bin/masscan"]
