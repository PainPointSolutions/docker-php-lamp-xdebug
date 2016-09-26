FROM nickistre/ubuntu-lamp-xdebug:latest

RUN apt-get install -y php5-curl && \
  a2enmod rewrite 

ADD php5/mods-available/xdebug_settings.ini /etc/php5/mods-available/xdebug_settings.ini

ENV XDEBUG_CONFIG="idekey=PHPSTORM"

EXPOSE 9001 
