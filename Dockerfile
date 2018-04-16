FROM php:7.1-fpm

WORKDIR /app

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - && \
    apt-get install -y nodejs && \
    apt-get install -y git && \
    apt-get install -y \
	    libjpeg62-turbo-dev  \
		libfreetype6-dev \
	    libmcrypt-dev \
        libpng-dev  \
		libicu-dev \
		libbz2-dev \
		libxml2-dev \
        libmagickwand-dev && \
    rm -rf /var/lib/apt/lists/*


RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/  && \
        docker-php-ext-install \
            mcrypt \
            bcmath \
            mbstring \
            zip \
            opcache \
            pdo_mysql \
            gd \
            xmlrpc \
            opcache \
            intl \
            mysqli \
            bz2 \
            exif && \
		(yes | pecl install imagick) && \
		docker-php-ext-enable imagick

COPY ./docker/php/fpm_www.conf /usr/local/etc/php-fpm.d/www.conf
COPY ./docker/php/php.ini /usr/local/etc/php/

ENV COMPOSER_HOME /composer
ENV PATH /composer/vendor/bin:$PATH
ENV COMPOSER_ALLOW_SUPERUSER 1
ENV COMPOSER_VERSION 1.4.2

RUN curl -o /tmp/composer-setup.php https://getcomposer.org/installer \
  && curl -o /tmp/composer-setup.sig https://composer.github.io/installer.sig \
  && php -r "if (hash('SHA384', file_get_contents('/tmp/composer-setup.php')) !== trim(file_get_contents('/tmp/composer-setup.sig'))) { unlink('/tmp/composer-setup.php'); echo 'Invalid installer' . PHP_EOL; exit(1); }"

RUN php /tmp/composer-setup.php --no-ansi --install-dir=/usr/local/bin --filename=composer --version=${COMPOSER_VERSION} && rm -rf /tmp/composer-setup.php

RUN curl -L -o /tmp/phpunit.phar  https://phar.phpunit.de/phpunit.phar \
  && mv /tmp/phpunit.phar /usr/local/bin/phpunit \
  && chmod +x /usr/local/bin/phpunit