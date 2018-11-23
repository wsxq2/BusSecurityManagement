rm /var/lib/mysql/csv/*.csv
mysql -uroot -p'your mysql root password' -e 'CALL export_csv("WeiZhang");CALL export_csv("RenYuan");CALL export_csv("CheDui");CALL export_csv("CheLiang");CALL export_csv("XianLu");CALL export_csv("SiJi");CALL export_csv("DuiZhang");CALL export_csv("LuDuiZhang");' bus
cd /mnt/c/Users/wsxq2/Documents/MY/workspace/da_san_shang/DBS/sj-DBS-design/front-end/c/csv/
cp /var/lib/mysql/csv/*.csv .
sed  -i  -e 's/"N/&\/A"/; 1i gonghao,xingming,xingbie,zhiwei\r' RenYuan.csv
sed  -i  -e 's/"N/&\/A"/; 1i cheduibianhao,cheduiming,duizhang,beizhuxinxi\r' CheDui.csv
sed  -i  -e 's/"N/&\/A"/; 1i chepaihao,zuoshu,suoshuxianlu,beizhuxinxi\r' CheLiang.csv
sed  -i  -e 's/"N/&\/A"/; 1i xianlubianhao,xianluming,suoshuchedui,beizhuxinxi\r' XianLu.csv
sed  -i  -e 's/"N/&\/A"/; 1i ID,siji,cheliang,weizhangleixin,shijian,zhandian\r' WeiZhang.csv
sed  -i  -e 's/"N/&\/A"/; 1i gonghao,suoshuxianlu\r' SiJi.csv
sed  -i  -e 's/"N/&\/A"/; 1i gonghao\r' DuiZhang.csv
sed  -i  -e 's/"N/&\/A"/; 1i gonghao\r' LuDuiZhang.csv
#find . -maxdepth 1 -name '*.csv' -type f -exec iconv --verbose -fUTF-8 -tGBK {} -o gbk/{} \;



