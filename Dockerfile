FROM ubuntu:latest

LABEL version=1.0
LABEL description="Esto es una imagen de apache corriendo en ubuntu"
LABEL vendor=MVV

RUN apt  update -y
RUN apt install apache2 -y

COPY startbootstrap-freelancer-master /var/www/html

RUN echo "$(whoami)" > /var/www/html/user1.html

RUN useradd manuelv

USER manuelv

RUN echo "$(whoami)" > /tmp/user2.html

USER root

RUN cp /tmp/user2.html /var/www/html/user2.html

COPY run.sh /run.sh

CMD sh /run.sh
