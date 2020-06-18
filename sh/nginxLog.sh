#!/bin/sh
# Program:
#     Auto cut nginx log script.
 
# nginx日志路径 
LOGS_PATH=/var/log/bs/nginx
TODAY=$(date -d 'today' +%Y-%m-%d)
 
# 移动日志并改名
mv ${LOGS_PATH}/error.log ${LOGS_PATH}/error_${TODAY}.log
mv ${LOGS_PATH}/access.log ${LOGS_PATH}/access_${TODAY}.log
 
# 向nginx主进程发送重新打开日志文件的信号
kill -USR1 $(cat /usr/local/nginx/logs/nginx.pid)