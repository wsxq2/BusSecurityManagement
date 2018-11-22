mysql -uroot -p'your mysql root password' < create_database_and_user.sql
mysql -uroot -p'your mysql root password' bus < procedure_root.sql
mysql -uwsxq -p'658231' bus < drop-all-table.sql
mysql -uwsxq -p'658231' bus < create-table.sql
mysql -uwsxq -p'658231' bus < triggers.sql
mysql -uwsxq -p'658231' bus < insert-data.sql
mysql -uwsxq -p'658231' bus < procedure.sql
mysql -uwsxq -p'658231' bus < create_user_info.sql

