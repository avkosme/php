FROM avkosme/centos	

RUN yum install -y epel-release
RUN yum install -y 	php php-mysql php-fpm

RUN systemctl enable php-fpm

COPY docker-entrypoint.sh /usr/local/bin/

RUN /bin/bash -c 'chmod +x /usr/local/bin/docker-entrypoint.sh'

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]

CMD ["sh", "-c", "/opt/init.sh"]
