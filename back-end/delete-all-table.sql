-- 在测试 C 语言前端程序时会用到该文件，因为需要删除所有的表再用C前端导入

SET NAMES 'utf8';
USE bus;
--
-- Delete data from the table 'WeiZhang'
--
TRUNCATE TABLE WeiZhang;
--
-- Delete data from the table 'LuDuiZhang'
--
TRUNCATE TABLE LuDuiZhang;
--
-- Delete data from the table 'SiJi'
--
DELETE FROM SiJi;
--
-- Delete data from the table 'CheLiang'
--
DELETE FROM CheLiang;
--
-- Delete data from the table 'XianLu'
--
DELETE FROM XianLu;
--
-- Delete data from the table 'CheDui'
--
DELETE FROM CheDui;
--
-- Delete data from the table 'DuiZhang'
--
DELETE FROM DuiZhang;
--
-- Delete data from the table 'RenYuan'
--
DELETE FROM RenYuan;
