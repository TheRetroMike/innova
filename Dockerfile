FROM ubuntu:18.04
RUN apt-get update -y
RUN apt-get install unzip wget build-essential libssl-dev libdb++-dev libboost-all-dev libminiupnpc-dev libqrencode-dev libevent-dev obfs4proxy libcurl4-openssl-dev -y
WORKDIR /opt/
RUN wget https://github.com/innova-foundation/innova/releases/download/v4.3.9.5/innovad-18.zip
RUN unzip innovad-18.zip
RUN chmod +x innovad
RUN rm innovad-18.zip
RUN wget https://raw.githubusercontent.com/TheRetroMike/rmt-nomp/master/scripts/blocknotify.c
RUN gcc blocknotify.c -o /usr/bin/blocknotify
CMD ./innovad -daemon;tail -f /root/.innova/debug.log
