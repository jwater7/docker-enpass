FROM ubuntu:xenial
LABEL maintainer "j"

ENV DEBIAN_FRONTEND noninteractive

ENV ENPASS_VERSION 6.0.6.323
RUN apt-get update \
    && apt-get install -y software-properties-common curl \
    && add-apt-repository "deb http://repo.sinew.in/ stable main" \
    && curl -fsSL https://dl.sinew.in/keys/enpass-linux.key | apt-key add - \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
        qt5-default libpulse0 libcurl3 libgtk-3-0 \
        enpass=${ENPASS_VERSION} \
    && apt-get autoclean \
    && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/*

CMD [ "/opt/enpass/Enpass" ]

