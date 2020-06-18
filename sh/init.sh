#!/bin/bash

# apache
apachectl start
echo "apache 启动成功"

# redis
redis-server /etc/bs/redis/redis.conf
echo "redis 启动成功"
