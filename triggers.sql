DELIMITER //
CREATE TRIGGER update_RenYuan_subclass_insert
AFTER INSERT ON RenYuan FOR EACH ROW
BEGIN
	IF RenYuan.zhiwei='司机' THEN
		INSERT INTO SiJi SET SiJi.gonghao=RenYuan.gonghao;
	ELSEIF RenYuan.zhiwei = '队长' THEN
		INSERT INTO DuiZhang SET DuiZhang.gonghao=RenYuan.gonghao;
	ELSEIF RenYuan.zhiwei = '路队长' THEN
		INSERT INTO LuDuiZhang SET LuDuiZhang.gonghao = RenYuan.gonghao;
	END IF;
END;//
DELIMITER ;

