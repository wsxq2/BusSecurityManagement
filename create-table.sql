
DROP TABLE WeiZhang;



DROP TABLE SiJi;



DROP TABLE CheLiang;



DROP TABLE XianLu;



DROP TABLE LuDuiZhang;



DROP TABLE CheDui;



DROP TABLE DuiZhang;



DROP TABLE RenYuan;



CREATE TABLE RenYuan
(
	gonghao              INTEGER NOT NULL,
	xingming             VARCHAR(20) NOT NULL,
	xingbie              ENUM('男', '女') NOT NULL,
	zhiwei               ENUM('司机', '路队长', '队长') NOT NULL,
	PRIMARY KEY (gonghao)
);



CREATE TABLE DuiZhang
(
	gonghao              INTEGER NOT NULL,
	PRIMARY KEY (gonghao),
	FOREIGN KEY (gonghao) REFERENCES RenYuan(gonghao)
		ON DELETE CASCADE
);



CREATE TABLE CheDui
(
	cheduibianhao        INTEGER NOT NULL,
	cheduiming           VARCHAR(20) NOT NULL,
	beizhuxinxi          VARCHAR(20) NULL,
	duizhang             INTEGER NOT NULL,
	PRIMARY KEY (cheduibianhao),
	FOREIGN KEY R_20 (duizhang) REFERENCES DuiZhang (gonghao)
);



CREATE UNIQUE INDEX AK ON CheDui
(
	duizhang
);



CREATE TABLE LuDuiZhang
(
	gonghao              INTEGER NOT NULL,
	PRIMARY KEY (gonghao),
	FOREIGN KEY (gonghao) REFERENCES RenYuan(gonghao)
		ON DELETE CASCADE
);



CREATE TABLE XianLu
(
	xianlubianhao        INTEGER NOT NULL,
	xianluming           VARCHAR(20) NOT NULL,
	beizhuxinxi          VARCHAR(100) NULL,
	chedui               INTEGER NOT NULL,
	duizhang             INTEGER NOT NULL,
	PRIMARY KEY (xianlubianhao),
	FOREIGN KEY R_6 (chedui) REFERENCES CheDui (cheduibianhao),
	FOREIGN KEY R_21 (duizhang) REFERENCES LuDuiZhang (gonghao)
);



CREATE UNIQUE INDEX ak ON XianLu
(
	duizhang
);



CREATE TABLE CheLiang
(
	chepaihao            VARCHAR(20) NOT NULL,
	zuoshu               INTEGER NOT NULL,
	beizhuxinxi          VARCHAR(20) NULL,
	xianlu               INTEGER NOT NULL,
	PRIMARY KEY (chepaihao),
	FOREIGN KEY R_8 (xianlu) REFERENCES XianLu (xianlubianhao)
);



CREATE TABLE SiJi
(
	gonghao              INTEGER NOT NULL,
	xianlu               INTEGER NOT NULL,
	PRIMARY KEY (gonghao),
	FOREIGN KEY (gonghao) REFERENCES RenYuan(gonghao)
		ON DELETE CASCADE,
	FOREIGN KEY R_22 (xianlu) REFERENCES XianLu (xianlubianhao)
);



CREATE TABLE WeiZhang
(
	ID                   INTEGER AUTO_INCREMENT,
	zhandian             VARCHAR(20) NOT NULL,
	shijian              DATETIME NOT NULL,
	weizhangleixin       ENUM('闯红灯','未礼让斑马线','压线','违章停车') NOT NULL,
	cheliang             VARCHAR(20) NOT NULL,
	siji                 INTEGER NOT NULL,
	PRIMARY KEY (ID),
	FOREIGN KEY R_23 (cheliang) REFERENCES CheLiang (chepaihao),
	FOREIGN KEY R_24 (siji) REFERENCES SiJi (gonghao)
)
 AUTO_INCREMENT = 1;



