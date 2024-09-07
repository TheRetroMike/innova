FROM ubuntu:18.04
RUN apt-get update -y
RUN apt-get install unzip wget -y
WORKDIR /opt/
RUN wget https://github.com/innova-foundation/innova/releases/download/v4.3.9.5/innovad-18.zip
RUN unzip innovad-18.zip
RUN chmod +x innovad
RUN rm innovad-18.zip
CMD ./innovad -daemon
