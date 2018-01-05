FROM ubuntu:xenial
ENV DEBIAN_FRONTEND noninteractive
MAINTAINER Cristian Bottazzi <cristian1604@educ.ar>

# Set LANG
RUN export LANG=C.UTF-8

# Add sudo and aptitude
RUN apt-get update && apt-get install -y sudo aptitude && aptitude safe-upgrade -y

# Add utils
RUN aptitude install -y \
    acl \   
    curl \
    git \
    vim \
    wget

# Add apache2
RUN aptitude install -y apache2

# Add supervisor
RUN aptitude install -y supervisor
RUN mkdir -p /var/log/supervisor 

# Config Apache
ADD apache2/apache_default /etc/apache2/sites-available/000-default.conf
ADD apache2/supervisor.conf /etc/supervisor/conf.d/apache2.conf

# Add php7.1
RUN \
  apt-get update && \
  apt-get install -y language-pack-en-base && \
  export LC_ALL=en_US.UTF-8 && \
  export LANG=en_US.UTF-8 && \
  apt-get install -y python-software-properties software-properties-common curl && \
  curl -sL https://deb.nodesource.com/setup_7.x | bash - && \
  curl -sL https://sentry.io/get-cli/ | bash && \
  add-apt-repository ppa:ondrej/php && \
  apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xF1656F24C74CD1D8 && \
  echo "deb http://mirror.aarnet.edu.au/pub/MariaDB/repo/10.1/ubuntu xenial main" >> /etc/apt/sources.list.d/mariadb101.list && \
  echo "deb-src http://mirror.aarnet.edu.au/pub/MariaDB/repo/10.1/ubuntu xenial main" >> /etc/apt/sources.list.d/mariadb101.list && \
  apt-get update && \
  apt-get install -y \
    php7.1 \
    php7.1-cli \
    php7.1-dev \
    php7.1-opcache \
    php7.1-bcmath \
    php7.1-bz2 \
    php7.1-common \
    php7.1-curl \
    php7.1-dba \
    php7.1-enchant \
    php7.1-gd \
    php7.1-imap \
    php7.1-json \
    php7.1-ldap \
    php7.1-mbstring \
    php7.1-mcrypt \
    php7.1-pspell \
    php7.1-readline \
    php7.1-soap \
    php7.1-xml \
    php7.1-zip \
    php7.1-mysql \
    php7.1-pgsql \
    php-imagick \
    php-redis \
    php7.1-sybase \
    git \
    nodejs \
    ruby \
    packaging-dev \
    dh-make \
    git-buildpackage \
    reprepro \
    libmariadbclient-dev \
    && \
  apt-get remove -y python-software-properties software-properties-common && \
  apt-get autoremove -y && \
  rm -rf /var/lib/apt/lists/*

ENV PHP_VERSION php7.1

# Config PHP
#RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf && \
#    sed -i "s/variables_order.*/variables_order = \"EGPCS\"/g" /etc/$PHP_VERSION/apache2/php.ini && \
#    sed -i 's/;\(date\.timezone =\)/\1 America\/Argentina\/Buenos_Aires/g' /etc/$PHP_VERSION/apache2/php.ini && \
#    sed -i 's/;\(date\.timezone =\)/\1 America\/Argentina\/Buenos_Aires/g' /etc/$PHP_VERSION/cli/php.ini

# Download composer, phpunit and nvm
#RUN wget -q -O /usr/local/bin/composer https://getcomposer.org/composer.phar && chmod +x /usr/local/bin/composer && \
#    wget -q -O /usr/local/bin/phpunit https://phar.phpunit.de/phpunit.phar && chmod +x /usr/local/bin/phpunit && \ 
#    wget -q -O /bin/install-nvm.sh https://raw.githubusercontent.com/creationix/nvm/master/install.sh && chmod +x /bin/install-nvm.sh


# Set the entry directory
WORKDIR /var/www/html

# Expose the ports
EXPOSE 80 8000 8080

# Clean image
# RUN rm -rf /var/lib/apt/lists/*

# Add image configuration and scripts
ADD scripts/*.sh /bin/

# Set permissions of scripts
RUN chmod 755 /bin/*.sh

CMD ["/bin/run.sh"]
