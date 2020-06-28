1. Create a volume to save world data `docker volume create bedrock-server-data`
2. Run server `docker run -d -it -p 19132:19132/udp --mount source=bedrock-server-data,target=/minecraft-server-data ycshao/bedrock-server`
3. To run command, attach to the container by running `docker attach xxx`
4. To detach, run Ctrl+P, Ctrl+Q
