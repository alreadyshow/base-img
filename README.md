# base-img 基础镜像


### 软件

- 应用软件
1. PHP7.2.31
2. redis
3. apache
4. nginx
5. rabbitmq
6. freetds
7. wkhtmltox

- 调试软件
1. top
2. traceroute
3. tcpdump
4. gdb
5. nslookup
6. ping
7. netstat
8. ps
9. vim
10. ss 

### 镜像使用

- docker-compose

1. 常用命令

 - `docker-compose up -d tj`
 - `docker-compose stop tj`
 - `docker-compose exec tj /bin/bash`
 - `docker-compose exec tj ps -ef`
 - `docker-compose logs tj`

2. 初始化容器
 
 1. `docker-compose up -d tj` 启动容器
 2. `docker-compose exec tj /usr/local/sh/init.sh` 初始化服务
 3. `docker-compose exec tj ps -ef` 检查容器服务是否正常启动

- docker

