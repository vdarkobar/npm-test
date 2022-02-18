#!/bin/bash
clear
echo -ne "${RED}Enter Time Zone: "; read TZONE; \
echo -ne "${RED}Enter NPM Port Number: "; read PORTN; \
db_root_pwd=$(tr -dc A-Za-z0-9 </dev/urandom | head -c 25); echo ${db_root_pwd} > secrets/db_root_pwd.secret && \
mysql_pwd=$(tr -dc A-Za-z0-9 </dev/urandom | head -c 25); echo ${mysql_pwd} > secrets/mysql_pwd.secret && \
sed -i "s|01|${TZONE}|" .env && \
sed -i "s|02|${PORTN}|" .env && \
rm README.md && \
rm data/mysql/tmp && \
rm letsencrypt/tmp && \
sudo chown -R root:root secrets/ && \
sudo chmod -R 600 secrets/ && \
sudo docker-compose up -d
