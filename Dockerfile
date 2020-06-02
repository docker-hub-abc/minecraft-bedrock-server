FROM ubuntu:20.04

RUN apt-get update && \
    apt-get install -y \
    unzip \
    curl \
    vim \
    && apt-get clean

EXPOSE 19132/udp

WORKDIR /minecraft-server-data

ADD https://minecraft.azureedge.net/bin-linux/bedrock-server-1.14.60.5.zip /minecraft-server-data

RUN unzip bedrock-server-1.14.60.5.zip && \
    rm bedrock-server-1.14.60.5.zip && \
    chmod +x bedrock_server 

CMD LD_LIBRARY_PATH=. ./bedrock_server

VOLUME ["/minecraft-server-data"]
