
CREATE TABLE RenYuan
(
	gonghao              INTEGER NOT NULL,
	xingming             VARCHAR(20) NOT NULL,
	xingbie              ENUM('男', '女') NOT NULL,
	zhiwei               ENUM('司机','队长') NOT NULL,
	PRIMARY KEY (gonghao)
);



CREATE TABLE DuiZhang
(
	gonghao              INTEGER NOT NULL,
	PRIMARY KEY (gonghao),
	FOREIGN KEY R_29 (gonghao) REFERENCES RenYuan (gonghao)
		ON DELETE CASCADE
);



CREATE TABLE CheDui
(
	cheduibianhao        INTEGER NOT NULL,
	cheduiming           VARCHAR(20) NOT NULL,
	duizhang             INTEGER NOT NULL,
	beizhuxinxi          VARCHAR(20) NULL,
	PRIMARY KEY (cheduibianhao),
	FOREIGN KEY R_20 (duizhang) REFERENCES DuiZhang (gonghao)
);



CREATE UNIQUE INDEX XAK1chedui ON CheDui
(
	duizhang,
	cheduiming
);



CREATE TABLE XianLu
(
	xianlubianhao        INTEGER NOT NULL,
	xianluming           VARCHAR(20) NOT NULL,
	suoshuchedui         INTEGER NOT NULL,
	beizhuxinxi          VARCHAR(100) NULL,
	PRIMARY KEY (xianlubianhao),
	FOREIGN KEY R_6 (suoshuchedui) REFERENCES CheDui (cheduibianhao)
);



CREATE UNIQUE INDEX XAK1xianlu ON XianLu
(
	xianluming
);



CREATE TABLE SiJi
(
	gonghao              INTEGER NOT NULL,
	suoshuxianlu         INTEGER NOT NULL,
	PRIMARY KEY (gonghao),
	FOREIGN KEY R_22 (suoshuxianlu) REFERENCES XianLu (xianlubianhao),
	FOREIGN KEY R_30 (gonghao) REFERENCES RenYuan (gonghao)
		ON DELETE CASCADE
);



CREATE TABLE LuDuiZhang
(
	gonghao              INTEGER NOT NULL,
	PRIMARY KEY (gonghao),
	FOREIGN KEY R_28 (gonghao) REFERENCES SiJi (gonghao)
		ON DELETE CASCADE
);



CREATE TABLE CheLiang
(
	chepaihao            VARCHAR(20) NOT NULL,
	suoshuxianlu         INTEGER NULL,
	zuoshu               INTEGER NOT NULL,
	beizhuxinxi          VARCHAR(20) NULL,
	PRIMARY KEY (chepaihao),
	FOREIGN KEY R_8 (suoshuxianlu) REFERENCES XianLu (xianlubianhao)
);



CREATE TABLE WeiZhang
(
	ID                   INTEGER AUTO_INCREMENT,
	siji                 INTEGER NOT NULL,
	cheliang             VARCHAR(20) NOT NULL,
	weizhangleixin       ENUM('闯红灯','未礼让斑马线','压线','违章停车') NOT NULL,
	shijian              DATETIME NOT NULL,
	zhandian             VARCHAR(20) NOT NULL,
	PRIMARY KEY (ID),
	FOREIGN KEY R_23 (cheliang) REFERENCES CheLiang (chepaihao),
	FOREIGN KEY R_24 (siji) REFERENCES SiJi (gonghao)
)
 AUTO_INCREMENT = 1;




