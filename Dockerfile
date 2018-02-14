FROM nickistre/ubuntu-lamp-xdebug:latest

RUN apt-get update 
RUN apt-get upgrade -y
RUN apt-get install -y curl php5-curl php5-geoip php5-mcrypt

RUN  a2enmod rewrite && \
  a2enmod headers && \
  php5enmod curl && \
  php5enmod geoip && \
  php5enmod mcrypt

ENV XDEBUG_CONFIG="idekey=PHPSTORM"

RUN curl -s -L https://raw.github.com/colinmollenhour/modman/master/modman-installer | bash -s && \
 mv ~/bin/modman /usr/local/bin/

EXPOSE 9000

WORKDIR /var/www/html

ADD etc/apache2/sites-enabled/000-default.conf /etc/apache2/sites-enabled/000-default.conf

CMD ["supervisord", "-n", "-c","/etc/supervisord.conf"]
