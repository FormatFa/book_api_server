# api db
FROM mysql:5.7
COPY ./book_api_table_init.sql /book_api_table_init.sql
ENV MYSQL_ROOT_PASSWORD=root
ENV MYSQL_USER=book
ENV MYSQL_PASSWORD=book
COPY book_api_table_init.sql /book_api_table_init.sql
# 后台管理系统的sql数据(应该放在后台管理工程？)
COPY book_api_table_init.sql /book_manage_data.sql
mysql -ubook -pbook < /book_api_table_init.sql
mysql -ubook -pbook < /book_manage_data.sql