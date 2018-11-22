DELIMITER //
--用户需求一：查询某个车队下的司机基本信息
DROP PROCEDURE IF EXISTS get_siji_by_chedui //
CREATE PROCEDURE
get_siji_by_chedui( cd INT)
BEGIN
	SELECT gonghao,xingming,xingbie FROM RenYuan WHERE gonghao IN (SELECT gonghao FROM SiJi WHERE suoshuxianlu IN (SELECT xianlubianhao FROM XianLu WHERE suoshuchedui=cd));
END
//

--用户需求二：查询某名司机在某个时间段的违章详细信息
DROP PROCEDURE IF EXISTS get_weizhang_by_siji_and_datetime //
CREATE PROCEDURE
get_weizhang_by_siji_and_datetime( sj TEXT, dt1 DATETIME, dt2 DATETIME)
BEGIN
	SELECT ID,siji,xingming,cheliang,weizhangleixin,shijian,zhandian FROM WeiZhang,RenYuan WHERE shijian BETWEEN dt1 AND dt2 AND WeiZhang.siji=RenYuan.gonghao AND xingming=sj;
END
//

--用户需求三：查询某个车队在某个时间段的违章统计信息
DROP PROCEDURE IF EXISTS get_weizhangtongji_by_chedui_and_datetime2 //
CREATE PROCEDURE
get_weizhangtongji_by_chedui_and_datetime2( cd INT, dt1 DATETIME, dt2 DATETIME)
BEGIN
	SELECT weizhangleixin, COUNT(id) FROM WeiZhang WHERE shijian BETWEEN dt1 AND dt2 AND siji IN (SELECT gonghao FROM SiJi WHERE suoshuxianlu IN (SELECT xianlubianhao FROM XianLu WHERE suoshuchedui=cd)) GROUP BY weizhangleixin;
END
//

--用户需求三升级版：查询某个车队的所有司机在某个时间段的违章统计信息
DROP PROCEDURE IF EXISTS get_weizhangtongji_by_chedui_and_datetime //
CREATE PROCEDURE
get_weizhangtongji_by_chedui_and_datetime( cd INT, dt1 DATETIME, dt2 DATETIME)
BEGIN
	SELECT gonghao,xingming,weizhangleixin,COUNT(*) FROM RenYuan,WeiZhang WHERE WeiZhang.siji=RenYuan.gonghao AND siji IN (SELECT gonghao FROM SiJi WHERE suoshuxianlu IN (SELECT xianlubianhao FROM XianLu WHERE suoshuchedui=cd)) AND shijian BETWEEN dt1 AND dt2 GROUP BY gonghao,xingming,weizhangleixin ORDER BY gonghao;
END
//

DELIMITER ;

/* for test
CALL get_siji_by_chedui(1);
CALL get_weizhang_by_siji_and_datetime('钱智美', '2018-01-01 00:00:00', '2018-10-01 00:00:00');
CALL get_weizhangtongji_by_chedui_and_datetime(1, '2018-01-01 00:00:00', '2018-10-01 00:00:00');
 */
