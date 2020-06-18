#!/bin/bash

function startProcess()
{
    pidFile=$1
    processName=$2
    startCmd=$3

    if [ -f ${pidFile} ];then
        echo "${processName} has started"
    else
        echo $startCmd
        echo "${processName} start successed"
    fi
}

# apache
startProcess /usr/local/apache/2.4.41/logs/httpd.pid apache `apachectl start`
# if [ ! -f "/usr/local/apache/2.4.41/logs/httpd.pid" ];then
#     echo "apache 已启动"
# else
#     apachectl start
#     echo "apache 启动成功"
# fi


# redis
startProcess /var/run/redis_6379.pid redis `redis-server /etc/bs/redis/redis.conf`
# if [ ! -f "/var/run/redis_6379.pid" ];then
#     echo "redis 已启动"
# else
#     redis-server /etc/bs/redis/redis.conf
#     echo "redis 启动成功"
# fi


