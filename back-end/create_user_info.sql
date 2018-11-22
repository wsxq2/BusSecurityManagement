DROP TABLE IF EXISTS user_info;
CREATE TABLE `user_info` ( `username` char(30) NOT NULL,
	`password` char(30) DEFAULT NULL,
	PRIMARY KEY (`username`));

INSERT INTO user_info
VALUES('admin',
	'658231');
