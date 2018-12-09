-- create_database_and_user.sql
-- 创建数据库和用户
CREATE DATABASE IF NOT EXISTS bus CHARACTER
SET = 'utf8';

DROP USER 'wsxq'@'%';

CREATE USER 'wsxq'@'%' IDENTIFIED BY '658231';


GRANT ALL PRIVILEGES ON bus.* TO 'wsxq'@'%';

FLUSH PRIVILEGES;
