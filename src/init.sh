# mysql
service mysql start
mysql -u user root init.sql
rm init.sql

# nginx
mv nginx.conf /etc/nginx/sites-available/chez-sgrondin.conf
ln -s /etc/nginx/sites-available/chez-sgrondin.conf /etc/nginx/sites-enabled/
rm -rf /etc/nginx/sites-enabled/default

# Wordpress
wget http://wordpress.org/latest.tar.gz
tar xfz latest.tar.gz
mkdir /var/www/html/chez-sgrondin
cp -R wordpress/* ./var/www/html/chez-sgrondin/
rm -R wordpress
rm latest.tar.gz
cd /var/www/html/chez-sgrondin/
mv wp-config-sample.php wp-config.php
sed -i 's/database_name_here/chez-sgrondin/' wp-config.php
sed -i 's/username_here/wpuser/' wp-config.php
sed -i 's/password_here/verysecurepassword/' wp-config.php
rm index.php
echo '<?php phpinfo();?>' > index.php
cd /
chown www-data:www-data /var/www/html/chez-sgrondin -R
chmod -R -wx,u+rwX,g+rX,o+rX /var/www/html/chez-sgrondin

service nginx start
service php7.3-fpm start

bash
# service mysql start