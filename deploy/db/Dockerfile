# api db
FROM mysql:5.7
ENV MYSQL_ROOT_PASSWORD=root
ENV MYSQL_USER=book
ENV MYSQL_PASSWORD=book
ENV MYSQL_DATABASE=book
# https://hub.docker.com/_/mysql/ #Initializing a fresh instance
# 复制初始化脚本
COPY book_api_table_init.sql /docker-entrypoint-initdb.d/
# 指定编码，创建数据库时默认使用，不然默认是latin1编码会保存不了中文，因为创建表结构时没指定编码
CMD ["--character-set-server=utf8mb4","--collation-server=utf8mb4_unicode_ci"]