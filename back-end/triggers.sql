DELIMITER //

CREATE TRIGGER zhiwei_siji
BEFORE INSERT ON SiJi FOR EACH ROW
BEGIN
	DECLARE zw enum('司机','队长');
	SELECT zhiwei FROM RenYuan WHERE RenYuan.gonghao=NEW.gonghao into zw;
	if zw!='司机' then
	   SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '插入的人员不是司机!';
	end if;

END;//

CREATE TRIGGER zhiwei_duizhang
BEFORE INSERT ON DuiZhang FOR EACH ROW
BEGIN
	DECLARE zw enum('司机','队长');
	SELECT zhiwei FROM RenYuan WHERE RenYuan.gonghao=NEW.gonghao into zw;
	if zw!='队长' then
	   SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '插入的人员不是队长!';
	end if;

END;//

DELIMITER ;

