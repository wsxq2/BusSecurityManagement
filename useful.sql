SHOW databases;
SHOW TABLES;
SHOW CREATE TABLE;
SHOW COLLATION WHERE CHARSET='utf8';
SHOW COLLATION WHERE CHARSET='latin1';
SHOW variables LIKE '%char%';
SHOW PROCEDURE status;
SHOW TRIGGERS;

-- 忽略外码删除表
SET foreign_key_checks = 0;
-- DROP语句
SELECT concat('DROP TABLE IF EXISTS ', TABLE_NAME, ';')
FROM information_schema.tables
WHERE table_schema = 'bus';

SET foreign_key_checks = 1;
