-- procedure_root.sql
-- 用于测试，将数据库中的某个表中的数据导出为 csv 文件，导出到 /var/lib/mysql/csv/ 目录下

DELIMITER //

DROP PROCEDURE IF EXISTS `export_csv` //
CREATE  PROCEDURE `export_csv`(IN tab_name TEXT )
BEGIN
	SET @t1 =concat("SELECT * FROM ",tab_name," INTO OUTFILE 'csv/",tab_name,".csv' FIELDS ENCLOSED BY '\"' TERMINATED BY ',' ESCAPED BY '\"' LINES TERMINATED BY '\r\n';");
	PREPARE `stmt` FROM @`t1`;
	execute `stmt`;
	deallocate prepare `stmt`;
END
//

DELIMITER ;

--CALL export_csv('RenYuan');
