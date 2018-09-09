#!/bin/sh

/opt/www.conf.sh && \

systemctl start php-fpm

exec "$@"
