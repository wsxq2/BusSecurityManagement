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



Messages maintainer: Bram Moolenaar <Bram@vim.org>
"triggers.sql" 26L, 625C
Trying definition from g:formatdef_mysql
Evaluated formatprg: sqlformat --keywords upper -
Using python 2 code...
Formatter mysql has errors: Traceback (most recent call last):
File "/root/.pyenv/versions/2.7.15/bin/sqlformat", line 11, in <module>
sys.exit(main())
File "/root/.pyenv/versions/2.7.15/lib/python2.7/site-packages/sqlparse/cli.py", line 180, in main
stream.write(s)
UnicodeEncodeError: 'ascii' codec can't encode characters in position 100-101: ordinal not in range(128)

Definition in 'g:formatdef_mysql' was unsuccessful.
No format definitions were successful.
Removing trailing whitespace...
Retabbing...
Autoindenting...
25 lines to indent...
26 lines indented
"triggers.sql" 26L, 621C written
21 more lines
21 fewer lines; before #2  3 seconds ago
