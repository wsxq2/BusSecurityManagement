DELIMITER //
DROP PROCEDURE IF EXISTS get_siji_by_chedui //

CREATE PROCEDURE 
get_siji_by_chedui( cd INT)
BEGIN  
	SELECT * FROM RenYuan WHERE gonghao in (SELECT gonghao from SiJi WHERE xianlu in (SELECT xianlubianhao FROM XianLu WHERE chedui=cd));
END 
//

DROP PROCEDURE IF EXISTS get_weizhang_by_siji_and_datetime //

CREATE PROCEDURE 
get_weizhang_by_siji_and_datetime( sj TEXT, dt1 DATETIME, dt2 DATETIME)
BEGIN  
	SELECT * FROM WeiZhang WHERE shijian between dt1 and dt2 and siji in (SELECT gonghao from RenYuan WHERE xingming=sj);
END 
//

DROP PROCEDURE IF EXISTS get_weizhangtongji_by_chedui_and_datetime //

CREATE PROCEDURE 
get_weizhangtongji_by_chedui_and_datetime( cd INT, dt1 DATETIME, dt2 DATETIME)
BEGIN  
	SELECT weizhangleixin, COUNT(id) FROM WeiZhang WHERE shijian between '2018-01-01 00:00:00' and '2018-10-01 00:00:00' and siji in (SELECT gonghao FROM SiJi WHERE xianlu in (SELECT xianlubianhao FROM XianLu WHERE chedui='1')) GROUP BY weizhangleixin;
END
//

/* Prepare does not support Load Data Infile: The list of statements that you can run with PREPARE are documented in this page: https://dev.mysql.com/doc/refman/5.7/en/sql-syntax-prepared-statements.html under the subheading "SQL Syntax Allowed in Prepared Statements". Note this list may be different in earlier versions of MySQL.
DELIMITER //
DROP PROCEDURE IF EXISTS import_csv //
CREATE PROCEDURE import_csv(tab_name TEXT)
BEGIN
	SET @t1=CONCAT("LOAD DATA LOCAL INFILE 'csv/", tab_name, ".csv' INTO TABLE ", tab_name, " FIELDS TERMINATED BY ',' ENCLOSED BY '\"' LINES TERMINATED BY '\r\n'");
	SELECT @t1;
	PREPARE stmt FROM @t1;
	EXECUTE stmt;
	DEALLOCATE PREPARE stmt;
END
//
DELIMITER ;
DROP TABLE IF EXISTS RenYuan;
CALL import_csv('RenYuan');
 */

/*for test*/
DELIMITER //
DROP PROCEDURE IF EXISTS `export_csv` //
CREATE  PROCEDURE `export_csv`(IN tab_name TEXT )
BEGIN
	SET @t1 =CONCAT("SELECT * FROM ",tab_name," INTO OUTFILE 'csv/",tab_name,".csv' FIELDS ENCLOSED BY '\"' TERMINATED BY ',' ESCAPED BY '\"' LINES TERMINATED BY '\r\n';");
	PREPARE `stmt` FROM @`t1`;
	EXECUTE `stmt`;
	DEALLOCATE PREPARE `stmt`;
END 
//

DELIMITER ;

CALL export_csv('RenYuan');
/*
CALL get_siji_by_chedui(1);
CALL get_weizhang_by_siji_and_datetime('孟沛凝', '2018-01-01 00:00:00', '2018-10-01 00:00:00');
CALL get_weizhangtongji_by_chedui_and_datetime(1, '2018-01-01 00:00:00', '2018-10-01 00:00:00');
SELECT * FROM RenYuan INTO OUTFILE 'RenYuan.csv' FIELDS ENCLOSED BY '"' TERMINATED BY ';' ESCAPED BY '"' LINES TERMINATED BY '\r\n';
LOAD DATA LOCAL INFILE 'csv/RenYuan.csv' INTO TABLE RenYuan FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\r\n';
 */

孟沛凝 2018-01-01 00:00:00 2018-10-01 00:00:00
孟沛凝,2018-01-01 00:00:00,2018-10-01 00:00:00
