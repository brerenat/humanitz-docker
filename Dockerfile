FROM steamcmd/steamcmd:ubuntu

USER root
WORKDIR /data

COPY ./entrypoint.sh /entrypoint.sh
COPY ./settings.ini /data/settings.ini

RUN chmod 777 /entrypoint.sh
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y gettext

RUN addgroup --system steam && \
adduser --system --home /home/steam --shell /bin/bash steam && \
usermod -aG steam steam &&

RUN chmod -R 777 /data

ENTRYPOINT ["/entrypoint.sh"]