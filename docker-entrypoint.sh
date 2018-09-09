#!/bin/sh

systemctl start php-fpm

exec "$@"
