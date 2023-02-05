FROM ubuntu:20.04
ARG DEBIAN_FRONTEND=noninteractive
RUN apt update && apt install apache2 apache2-utils wget unzip -y
WORKDIR /tmp
RUN wget https://www.tooplate.com/zip-templates/2119_gymso_fitness.zip && unzip -o 2119_gymso_fitness
RUN rm -rf /var/www/html/* && cp -r 2119_gymso_fitness/* /var/www/html/
VOLUME /var/www/html/
WORKDIR /var/www/html/
EXPOSE 80
CMD ["apache2ctl", "-D", "FOREGROUND"]
