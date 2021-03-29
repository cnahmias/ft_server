FROM debian:buster

RUN apt-get update
RUN apt-get install -y nginx mariadb-server mariadb-client php-cgi php-common php-fpm php-pear php-mbstring php-zip php-net-socket php-gd php-xml-util php-gettext php-mysql php-bcmath unzip wget
COPY ./src/* .

CMD bash init.sh