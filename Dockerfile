FROM nickistre/ubuntu-lamp-xdebug:latest

RUN apt-get update 
RUN apt-get upgrade -y 
RUN apt-get install -y php5-curl php5-geoip 

RUN  a2enmod rewrite && \
  php5enmod curl && \
  php5enmod geoip

ENV XDEBUG_CONFIG="idekey=PHPSTORM"

EXPOSE 9000

WORKDIR /var/www/html

CMD ["supervisord", "-n", "-c","/etc/supervisord.conf"]
