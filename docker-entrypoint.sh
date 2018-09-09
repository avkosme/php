#!/bin/sh

printenv >> /etc/sysconfig/php-fpm

/opt/www.conf.sh && \

systemctl start php-fpm

exec "$@"
