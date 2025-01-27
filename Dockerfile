FROM steamcmd/steamcmd:ubuntu

USER root
WORKDIR /root

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y gettext
RUN apt-get install adduser

RUN addgroup --system steam && \
adduser --system --home /home/steam --shell /bin/bash steam && \
usermod -aG steam steam

COPY ./entrypoint.sh /entrypoint.sh
COPY ./settings.ini /settings.ini
RUN chmod 777 /entrypoint.sh
RUN chmod 777 /settings.ini

RUN mkdir /data
RUN chmod -R 777 /data

USER steam
WORKDIR /home/steam

ENV HOME=/home/steam USER=steam
ENV LD_LIBRARY_PATH=/home/steam/.steam/sdk32:/home/steam/.steam/sdk64:/home/steam/.steam/sdk32
ENV PATH=/home/steam/.local/bin:/usr/local/share/enshrouded-config:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

EXPOSE 7777/tcp
EXPOSE 7777/udp
EXPOSE 27015/tcp
EXPOSE 27015/udp

ENTRYPOINT ["/entrypoint.sh"]