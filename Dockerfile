FROM nickistre/ubuntu-lamp-xdebug:latest

RUN a2enmod rewrite 

ADD php5/mods-available/xdebug_settings.ini /etc/php5/mods-available/xdebug_settings.ini

ENV XDEBUG_CONFIG="idekey=PHPSTORM"

EXPOSE 9000 
