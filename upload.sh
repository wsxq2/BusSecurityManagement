scp -r -P 26635  back-end/ root@wsxq21.55555.io:~/
scp -r -P 26635  "front-end/web/" root@wsxq21.55555.io:/var/www/html/
echo '
shopt -s extglob
rm -rf /var/www/html/backup/*
mv /var/www/html/!(web|backup) /var/www/html/backup/
mv /var/www/html/web/* /var/www/html/
' | ssh -p26635 root@wsxq21.55555.io

