#!/bin/bash
clear
db_root_pwd=$(tr -dc A-Za-z0-9 </dev/urandom | head -c 25); echo ${db_root_pwd} > secrets/db_root_pwd.secret && \
mysql_pwd=$(tr -dc A-Za-z0-9 </dev/urandom | head -c 25); echo ${mysql_pwd} > secrets/mysql_pwd.secret && \
sudo chown -R root:root secrets/ && \
sudo chmod -R 600 secrets/ && \
sudo docker-compose up -d
