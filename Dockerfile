FROM debian:stable

LABEL maintainer="gregor.riepl@swisstxt.ch"
LABEL description="Debian-based ApacheDS container"

RUN apt update -y && apt upgrade -y && apt install -y ldap-utils apacheds

COPY startup.sh /startup.sh
COPY log4j.properties /etc/apacheds/log4j.properties

EXPOSE 10389
CMD ["/bin/sh", "/startup.sh"]
