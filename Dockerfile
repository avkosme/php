FROM avkosme/centos	

RUN yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
RUN yum install -y http://rpms.remirepo.net/enterprise/remi-release-7.rpm
RUN yum install -y yum-utils
RUN yum-config-manager --enable remi-php71
RUN yum install -y php php-mcrypt php-cli php-gd php-curl php-mysql php-ldap php-zip php-fileinfo

RUN yum install -y 	php-fpm

RUN systemctl enable php-fpm

ADD assets/www.conf.sh /opt/www.conf.sh
RUN /bin/bash -c 'chmod +x /opt/www.conf.sh'

COPY docker-entrypoint.sh /usr/local/bin/

RUN /bin/bash -c 'chmod +x /usr/local/bin/docker-entrypoint.sh'

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]

CMD ["sh", "-c", "/opt/init.sh"]
