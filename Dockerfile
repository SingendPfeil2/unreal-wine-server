FROM        ubuntu:latest

MAINTAINER  HCGCLOUD, <service@hcgcloud.com>

ENV DEBIAN_FRONTEND noninteractive

# Install Dependencies
RUN         dpkg --add-architecture i386 && \
            apt update && \
            apt upgrade -y && \
            apt install -y --install-recommends software-properties-common wine64 libstdc++6 lib32stdc++6 curl iproute2 openssl lib32gcc1 libntlm0 wget && \
            useradd -d /home/container -m container && \
            cd /home/container

USER        container
ENV         HOME /home/container
ENV         WINEARCH win64
ENV         WINEPREFIX /home/container/.wine64
WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD         ["/bin/bash", "/entrypoint.sh"]