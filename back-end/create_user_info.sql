-- create_user_info.sql
-- 创建用于 web 前端登陆的用户信息，即在前端使用 user_info 表中的用户名和密码登陆
DROP TABLE IF EXISTS user_info;
CREATE TABLE `user_info` ( `username` char(30) NOT NULL,
	`password` char(30) DEFAULT NULL,
	PRIMARY KEY (`username`));

INSERT INTO user_info
VALUES('admin',
	'658231');
