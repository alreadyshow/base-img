FROM alreadyshow/base-img:v2

LABEL version="1.02"

LABEL description="BS基础镜像全量环境"

WORKDIR /var/www

USER root

ENV CMAKE_HOME=/home/software/cmake \
    APACHE_HOME=/usr/local/apache/2.4.41 \
    NGINX_HOME=/usr/local/nginx \
    PHP_HOME=/usr/local/php \
    ERLANG_HOME=/usr/local/erlang \
    RABBITMQ_HOME=/usr/local/rabbitmq \
    PATH=$PATH:/home/software/cmake/bin:/usr/local/apache/2.4.41/bin:/usr/local/nginx/sbin:/usr/local/php/bin:/usr/local/erlang/bin:/usr/local/rabbitmq/sbin

COPY etc/bs /etc/bs

COPY sh/ /usr/local/sh

RUN mkdir -p /home/data/redis /home/data/mysql && \
    chmod -R +x /usr/local/sh 

ENTRYPOINT [ "/usr/sbin/init" ]


EXPOSE 80 8088 8086 6379 443 3306

# CMD [ "/usr/local/sh/init.sh" ]