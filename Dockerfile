FROM alpine:3.12.0

WORKDIR /minecraft-server-data
ADD https://minecraft.azureedge.net/bin-linux/bedrock-server-1.16.0.2.zip /minecraft-server-data
RUN unzip bedrock-server-1.16.0.2.zip && \
    rm bedrock-server-1.16.0.2.zip && \
    chmod +x bedrock_server

FROM ubuntu:20.04

RUN apt-get update && \
    apt-get install -y \
    curl \
    vim \
    && apt-get clean

EXPOSE 19132/udp

WORKDIR /minecraft-server-data
COPY --from=0 /minecraft-server-data .
CMD LD_LIBRARY_PATH=. ./bedrock_server

VOLUME ["/minecraft-server-data"]
