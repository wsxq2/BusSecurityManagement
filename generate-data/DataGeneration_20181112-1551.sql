﻿--
-- Script was generated by Devart dbForge Data Generator for MySQL, Version 2.1.36.0
-- Product Home Page: http://www.devart.com/dbforge/mysql/data-generator
-- Script date 2018/11/14 14:20:49
-- Target server version: 5.5.60-MariaDB
-- Target connection string: User Id=wsxq;Host=master;Database=bus;Character Set=utf8
--



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

--
-- Inserting data into table RenYuan
--
INSERT INTO RenYuan(gonghao, xingming, xingbie, zhiwei) VALUES
(0, '姚琨瑶', '男', '司机'),
(1, '冯晴田', '女', '司机'),
(2, '金韶仪', '女', '司机'),
(3, '夏国娟', '男', '司机'),
(4, '郝姮娥', '男', '司机'),
(5, '钱智美', '女', '司机'),
(6, '董绮文', '男', '司机'),
(7, '于语心', '女', '司机'),
(8, '黄欣美', '女', '队长'),
(9, '范代容', '女', '司机'),
(10, '崔诗槐', '男', '司机'),
(11, '田冰蓝', '女', '司机'),
(12, '曹从南', '男', '司机'),
(13, '蒋彤云', '男', '司机'),
(14, '贺滇萍', '女', '司机'),
(15, '钟舒兰', '男', '司机'),
(16, '武若淑', '女', '司机'),
(17, '万韶敏', '男', '司机'),
(18, '任敏慧', '女', '司机'),
(19, '蒋芸儿', '男', '司机'),
(20, '戴天音', '女', '司机'),
(21, '江梓瑶', '男', '司机'),
(22, '白笑妍', '男', '司机'),
(23, '尹恨桃', '男', '司机'),
(24, '贾巧曼', '男', '司机'),
(25, '戴桃花', '男', '司机'),
(26, '白妍青', '女', '司机'),
(27, '漕绿柏', '男', '司机'),
(28, '万丹溪', '男', '司机'),
(29, '李莉颖', '女', '司机'),
(30, '余文姝', '女', '司机'),
(31, '田水蓉', '男', '司机'),
(32, '尹淑婉', '男', '司机'),
(33, '于琇芬', '男', '司机'),
(34, '邵胜花', '男', '司机'),
(35, '彭初丹', '男', '司机'),
(36, '贾笑南', '女', '司机'),
(37, '常学英', '男', '司机'),
(38, '朱寻文', '男', '司机'),
(39, '易悦人', '女', '司机'),
(40, '钟雁丝', '女', '司机'),
(41, '李逸致', '女', '司机'),
(42, '贺笑槐', '男', '司机'),
(43, '唐沛文', '男', '司机'),
(44, '郝雪冰', '男', '司机'),
(45, '苏秋蝶', '女', '司机'),
(46, '许凡桃', '女', '司机'),
(47, '方语蓉', '男', '司机'),
(48, '宋萧曼', '女', '司机'),
(49, '孟沛凝', '男', '司机');

--
-- Inserting data into table DuiZhang
--
INSERT INTO DuiZhang(gonghao) VALUES
(29),
(7);

--
-- Inserting data into table CheDui
--
INSERT INTO CheDui(cheduibianhao, cheduiming, duizhang, beizhuxinxi) VALUES
(0, '飞虎队', 29, NULL),
(1, '高兴队', 7, NULL);

--
-- Inserting data into table XianLu
--
INSERT INTO XianLu(xianlubianhao, xianluming, suoshuchedui, beizhuxinxi) VALUES
(0, '高校1号线', 0, NULL),
(1, '921路', 0, NULL),
(2, '916路', 0, NULL),
(3, '922路', 0, NULL),
(4, '高校3号线', 1, NULL),
(5, '173路', 1, NULL),
(6, '4-16路', 1, NULL),
(7, '4-11路  ', 1, NULL);

--
-- Inserting data into table CheLiang
--
INSERT INTO CheLiang(chepaihao, suoshuxianlu, zuoshu, beizhuxinxi) VALUES
('陕C27549', 5, 99, NULL),
('陕V18524', 3, 99, NULL),
('陕D90338', 4, 20, NULL),
('陕E97292', 5, 41, NULL),
('陕C29225', 1, 65, NULL),
('陕G83263', 1, 36, NULL),
('陕H55329', 6, 35, NULL),
('陕C83395', 0, 90, NULL),
('陕G03734', 3, 81, NULL),
('陕A91561', 3, 91, NULL),
('陕V15652', 3, 72, NULL),
('陕F09465', 7, 100, NULL),
('陕A08910', 0, 69, NULL),
('陕A36729', 4, 69, NULL),
('陕F64846', 2, 76, NULL),
('陕D60362', 0, 62, NULL),
('陕B44946', 5, 50, NULL),
('陕H84550', 3, 84, NULL),
('陕D87677', 6, 63, NULL),
('陕B96319', 4, 51, NULL),
('陕B22631', 3, 83, NULL),
('陕A93668', 5, 55, NULL),
('陕A42517', 3, 99, NULL),
('陕E25210', 4, 34, NULL),
('陕C44614', 4, 66, NULL),
('陕E07369', 7, 35, NULL),
('陕V94265', 6, 70, NULL),
('陕C12101', 6, 94, NULL),
('陕C43656', 4, 77, NULL),
('陕K86604', 1, 47, NULL),
('陕G29701', 6, 73, NULL),
('陕G84305', 1, 33, NULL),
('陕E02383', 6, 61, NULL),
('陕C17006', 0, 42, NULL),
('陕A61515', 1, 82, NULL),
('陕K87529', 3, 39, NULL),
('陕G22057', 0, 45, NULL),
('陕H91152', 6, 91, NULL),
('陕D03692', 7, 35, NULL),
('陕H41563', 1, 54, NULL),
('陕F38757', 1, 86, NULL),
('陕A12653', 0, 97, NULL),
('陕G18897', 4, 77, NULL),
('陕C64256', 1, 55, NULL),
('陕H10788', 0, 51, NULL),
('陕B25266', 1, 53, NULL),
('陕D68215', 4, 28, NULL),
('陕J01201', 6, 56, NULL),
('陕C27011', 4, 42, NULL),
('陕E24926', 7, 94, NULL);

--
-- Inserting data into table SiJi
--
INSERT INTO SiJi(gonghao, suoshuxianlu) VALUES
(22, 2),
(21, 6),
(16, 4),
(11, 0),
(42, 7),
(46, 4),
(28, 1),
(37, 2),
(3, 1),
(23, 2),
(29, 2),
(44, 0),
(9, 7),
(17, 6),
(49, 3),
(24, 0),
(47, 4),
(45, 7),
(48, 0),
(43, 4),
(38, 0),
(33, 6),
(4, 3),
(10, 6),
(30, 2),
(25, 1),
(12, 4),
(5, 2),
(0, 7),
(6, 4),
(31, 3),
(39, 2),
(18, 5),
(34, 4),
(40, 2),
(1, 7),
(26, 5),
(35, 0),
(41, 7),
(7, 6);

--
-- Inserting data into table LuDuiZhang
--
INSERT INTO LuDuiZhang(gonghao) VALUES
(11),
(48),
(6),
(7),
(3),
(42),
(10),
(40);

--
-- Inserting data into table WeiZhang
--
INSERT INTO WeiZhang(ID, siji, cheliang, weizhangleixin, shijian, zhandian) VALUES
(1, 18, '陕A61515', '违章停车', '2018-04-30 13:35:09', '朱雀森林公园'),
(2, 16, '陕A93668', '压线', '2018-09-12 23:14:55', '赵村西'),
(3, 16, '陕G18897', '未礼让斑马线', '2018-01-15 19:04:38', '张家堡南街'),
(4, 0, '陕G83263', '未礼让斑马线', '2018-01-01 00:00:03', '钟楼(东,骡马市)'),
(5, 45, '陕V18524', '违章停车', '2018-02-06 10:31:49', '丈八二路南段'),
(6, 5, '陕J01201', '闯红灯', '2018-08-12 21:24:54', '再生资源市场'),
(7, 35, '陕F64846', '未礼让斑马线', '2018-04-03 08:36:31', '张家堡西'),
(8, 24, '陕F64846', '压线', '2018-01-03 02:56:15', '政法大学南校区'),
(9, 35, '陕C27549', '压线', '2018-04-09 18:48:53', '嘴头'),
(10, 38, '陕F38757', '违章停车', '2018-03-11 11:52:57', '朱宏路(朱宏立交北)'),
(11, 47, '陕C44614', '未礼让斑马线', '2018-02-04 12:54:46', '赵家村'),
(12, 43, '陕C44614', '违章停车', '2018-06-09 21:25:39', '枣园'),
(13, 44, '陕C29225', '违章停车', '2018-04-20 23:00:48', '子午镇'),
(14, 37, '陕V18524', '违章停车', '2018-05-21 00:25:26', '钟楼(南)'),
(15, 23, '陕A12653', '压线', '2018-06-25 18:37:01', '丈八六路'),
(16, 47, '陕A42517', '压线', '2018-09-15 01:29:19', '张家堡西(盐张村)'),
(17, 9, '陕D03692', '违章停车', '2018-11-02 21:24:55', '枣园刘村'),
(18, 10, '陕V18524', '压线', '2018-02-22 23:00:40', '中交西筑'),
(19, 16, '陕C44614', '闯红灯', '2018-04-29 05:51:08', '张家堡新区'),
(20, 39, '陕C43656', '违章停车', '2018-01-01 01:37:15', '纸筋厂'),
(21, 45, '陕A12653', '压线', '2018-03-02 00:46:55', '钟楼(西)'),
(22, 37, '陕A08910', '违章停车', '2018-02-08 06:40:46', '竹园村'),
(23, 33, '陕H91152', '闯红灯', '2018-01-14 22:51:48', '枣园小区'),
(24, 12, '陕C83395', '未礼让斑马线', '2018-01-01 00:00:04', '紫薇B区'),
(25, 5, '陕A93668', '违章停车', '2018-01-01 00:05:48', '政法干校'),
(26, 18, '陕H10788', '未礼让斑马线', '2018-07-17 19:41:33', '至相寺'),
(27, 7, '陕H10788', '未礼让斑马线', '2018-03-25 07:26:33', '赵坡桥'),
(28, 35, '陕H10788', '未礼让斑马线', '2018-01-01 00:01:12', '丈八六路南段'),
(29, 43, '陕G22057', '违章停车', '2018-09-12 12:30:13', '中联家居'),
(30, 6, '陕B25266', '违章停车', '2018-03-30 21:41:40', '赵西村'),
(31, 5, '陕A12653', '违章停车', '2018-01-01 00:00:11', '张家村'),
(32, 40, '陕D03692', '违章停车', '2018-07-28 01:36:42', '皂河桥'),
(33, 25, '陕G03734', '未礼让斑马线', '2018-10-15 07:53:24', '政法学院'),
(34, 37, '陕D03692', '未礼让斑马线', '2018-07-17 11:12:55', '钟研所'),
(35, 47, '陕E07369', '违章停车', '2018-01-01 00:10:48', '张家坡'),
(36, 48, '陕D03692', '未礼让斑马线', '2018-01-01 00:00:05', '祝村'),
(37, 1, '陕C27011', '违章停车', '2018-10-05 05:53:59', '造纸机械厂'),
(38, 40, '陕H41563', '压线', '2018-02-03 19:38:19', '中山门'),
(39, 29, '陕B25266', '压线', '2018-09-23 06:05:51', '丈八七路南段'),
(40, 42, '陕A12653', '违章停车', '2018-01-01 00:00:26', '肿瘤医院'),
(41, 40, '陕C27011', '违章停车', '2018-10-28 23:03:45', '制药厂'),
(42, 7, '陕F38757', '闯红灯', '2018-01-01 00:24:42', '紫薇城市花园'),
(43, 48, '陕K87529', '违章停车', '2018-02-13 20:22:56', '政法学院(陕师大)'),
(44, 1, '陕E25210', '违章停车', '2018-01-01 00:01:28', '智慧城'),
(45, 6, '陕C17006', '未礼让斑马线', '2018-03-23 17:30:21', '振兴公交广告(科技四路东段)'),
(46, 39, '陕D60362', '压线', '2018-02-28 05:00:53', '张家湾村'),
(47, 10, '陕F64846', '压线', '2018-09-10 04:10:57', '丈八三路南段'),
(48, 10, '陕C29225', '违章停车', '2018-09-21 03:06:42', '振兴公交广告(科技四路西段)'),
(49, 42, '陕K87529', '压线', '2018-07-30 22:42:09', '造纸机械厂(阿房四路)'),
(50, 44, '陕D60362', '违章停车', '2018-08-16 03:48:09', '丈八四路');