#!/bin/bash


DIR_LIST=(
"/var/log/bs/redis"
"/var/log/bs/mysql"
"/var/log/bs/php"
"/var/log/bs/httpd"
"/var/log/bs/nginx"
"/home/data/mysql"
"/home/data/redis"
)


for dir in ${DIR_LIST[@]}
do
    # echo $dir
    if [ ! -d $dir ];then
        mkdir -p $dir
        # echo "${dir}文件夹已经存在"
    else
        echo "${dir}文件夹已经存在"
    fi
done

