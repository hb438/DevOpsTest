FROM php:7.1.9-fpm

RUN printf "deb http://archive.debian.org/debian/ jessie main\ndeb-src http://archive.debian.org/debian/ jessie main\ndeb http://security.debian.org jessie/updates main\ndeb-src http://security.debian.org jessie/updates main" > /etc/apt/sources.list

# Additional tools
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    curl \
    openssl \
    nano

# Common php-ext and requirements
RUN apt-get install -y --no-install-recommends libpq-dev libz-dev \
    && docker-php-ext-install pcntl \
    && docker-php-ext-install session \
    && docker-php-ext-install phar \
    && docker-php-ext-install iconv \
    && docker-php-ext-install pdo

# Install gd and requirements
RUN apt-get install -y --no-install-recommends libjpeg-dev libpng12-dev libfreetype6-dev \
    && docker-php-ext-configure gd \
        --enable-gd-native-ttf \
        --with-jpeg-dir=/usr/lib \
        --with-freetype-dir=/usr/include/freetype2 \
    && docker-php-ext-install gd

# Install zip, bz2 and requirements
RUN apt-get install -y --no-install-recommends libbz2-dev zlib1g-dev \
    && docker-php-ext-install zip bz2

# Install mbstring
RUN docker-php-ext-install mbstring pdo_pgsql opcache


# Copy opcache configration
COPY ./opcache.ini /usr/local/etc/php/conf.d/opcache.ini


# Install the composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer


# Install xml, dom xmlrpc, xsl, and requirements
RUN apt-get install -y --no-install-recommends libxml2-dev libxslt-dev \
    && docker-php-ext-install json \
    xml \
    dom \
    xmlrpc \
    xsl

RUN apt-get update -yq \
    && apt-get install curl gnupg -yq \
    && curl -sL https://deb.nodesource.com/setup_8.x | bash \
    && apt-get install nodejs -yq

# Install intl and requirements
RUN apt-get install -y --no-install-recommends zlib1g-dev libicu-dev g++ \
    && docker-php-ext-configure intl \
    && docker-php-ext-install intl

# Clear package lists
RUN rm -rf /var/lib/apt/lists/*

RUN mkdir -p storage/framework/{sessions,views,cache}

# Permissions
RUN chown -R root:www-data /var/www/html
RUN chmod u+rwx,g+rx,o+rx /var/www/html
RUN find /var/www/html -type d -exec chmod u+rwx,g+rx,o+rx {} +
RUN find /var/www/html -type f -exec chmod u+rw,g+rw,o+r {} +

CMD ["php-fpm"]

EXPOSE 9000
