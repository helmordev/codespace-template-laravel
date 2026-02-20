FROM mcr.microsoft.com/devcontainers/base:ubuntu-24.04

ARG PHP_VERSION=8.5

# Install PHP, Composer, and Bun in a single layer to minimize image size
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    # Add ondrej/php PPA without software-properties-common (avoids pulling Python)
    && apt-get install -y --no-install-recommends ca-certificates curl gnupg2 unzip git sqlite3 \
    && echo "deb https://ppa.launchpadcontent.net/ondrej/php/ubuntu noble main" > /etc/apt/sources.list.d/ondrej-php.list \
    && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 4F4EA0AAE5267A6C \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
        php${PHP_VERSION}-cli \
        php${PHP_VERSION}-curl \
        php${PHP_VERSION}-mbstring \
        php${PHP_VERSION}-xml \
        php${PHP_VERSION}-zip \
        php${PHP_VERSION}-bcmath \
        php${PHP_VERSION}-intl \
        php${PHP_VERSION}-sqlite3 \
        php${PHP_VERSION}-mysql \
        php${PHP_VERSION}-redis \
        php${PHP_VERSION}-xdebug \
    # Disable xdebug by default to reduce runtime overhead (~15% CPU + memory)
    && phpdismod xdebug \
    # Install Composer
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    # Install Bun
    && curl -fsSL https://bun.sh/install | bash \
    && mv /root/.bun/bin/bun /usr/local/bin/bun \
    && ln -sf /usr/local/bin/bun /usr/local/bin/bunx \
    && rm -rf /root/.bun \
    # Clean up apt caches and temp files
    && apt-get purge -y --auto-remove gnupg2 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
