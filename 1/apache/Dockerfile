# docker build . --tag php7.2:latest
FROM debian:buster-slim
WORKDIR /var/www/html
#COPY . /var/www/html
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y curl wget gnupg2 ca-certificates lsb-release apt-transport-https && \
    wget https://packages.sury.org/php/apt.gpg && \
    apt-key add apt.gpg && \
    echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php7.list && \
    apt-get update && apt-get upgrade -y && \
    apt-get install -y php7.2 php7.2-cli php7.2-common php7.2-mbstring \
    php7.2-zip php7.2-intl php7.2-xml php7.2-json php7.2-curl

#RUN echo "HEllo, Docker Tutorial"
#EXPOSE 80
#FROM php:7.2-apache
#WORKDIR /var/www/html
#COPY . /var/www/html
#RUN apt-get update \
#	&& apt-get install -y curl wget \
#	&& apt-get install lsb-release software-properties-common -y \
#	&& apt-get update \
#	php7.2-mbstring php7.2-zip php7.2-intl php7.2-xml php7.2-json php7.2-curl
#	&& echo "HEllo, Docker Tutorial"
#EXPOSE 80
