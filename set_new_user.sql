drop user 'wsxq'@'%';
create user 'wsxq'@'%' identified by '658231';
grant ALL PRIVILEGES on test.* to 'wsxq'@'%';
grant ALL PRIVILEGES on bus.* to 'wsxq'@'%';

flush privileges;
