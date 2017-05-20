FROM base-centos:latest
MAINTAINER GergunD <gergund@gmail.com>
ENV container docker

RUN yum install -y nginx
RUN systemctl enable nginx
RUN yum install -y https://rpms.remirepo.net/enterprise/remi-release-7.rpm
RUN yum --enablerepo=remi-php70 install -y php.x86_64 php-bcmath.x86_64 php-cli.x86_64 php-common.x86_64 php-dba.x86_64 php-dbg.x86_64 php-devel.x86_64 php-enchant.x86_64 php-fpm.x86_64 php-gd.x86_64 php-gmp.x86_64 php-intl.x86_64 php-json.x86_64 php-mbstring.x86_64 php-mcrypt.x86_64 php-mysqlnd.x86_64 php-pdo.x86_64 php-pear.noarch php-pecl-xdebug.x86_64 php-process.x86_64 php-pspell.x86_64 php-recode.x86_64 php-soap.x86_64 php-xml.x86_64 php-xmlrpc.x86_64 php-opcache.x86_64 php-pecl-amqp.x86_64 php-pecl-redis.x86_64
RUN systemctl enable php-fpm

ADD confs/nginx.conf /etc/nginx/nginx.conf
ADD confs/app.conf /etc/nginx/conf.d/app.conf
ADD confs/www.conf /etc/php-fpm.d/www.conf


EXPOSE 22
EXPOSE 80
EXPOSE 443

VOLUME ["/var/www/html"]

VOLUME ["/sys/fs/cgroup"]
CMD ["/usr/sbin/init"]
