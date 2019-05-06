FROM debian:stable

LABEL maintainer="gregor.riepl@swisstxt.ch"
LABEL description="Debian-based ApacheDS container"

RUN apt update -y && apt install -y apacheds

COPY startup.sh /startup.sh
COPY log4j.properties /usr/share/apacheds/instances/default/conf/log4j.properties

EXPOSE 10389
CMD ["/bin/sh", "/startup.sh"]
