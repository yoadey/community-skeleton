FROM thecodingmachine/php:8.2-v4-apache

ENV PHP_MEMORY_LIMIT=512M \
    PHP_EXTENSION_MAILPARSE=1 \
    PHP_EXTENSION_IMAP=1 \
    APACHE_DOCUMENT_ROOT=/var/www/html/public

RUN composer clear-cache \
    && composer create-project uvdesk/community-skeleton /var/www/html

RUN a2enmod rewrite \
    && cd /var/www/html/ \
    && chmod 777 .env var config \
    && php bin/console c:c