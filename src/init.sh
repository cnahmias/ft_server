# mysql
service mysql start
mysql -u user root init.sql
rm init.sql

# SSH
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-ssl.key -out /etc/ssl/certs/nginx-ssl.crt -subj "/C=FR/ST=Paris/L=Île-de-France/O=42/OU=sgrondin/CN=chez-sgrondin"

# nginx
mv nginx.conf /etc/nginx/sites-available/
ln -s /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/
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
cd /var/www/html
echo '<?php phpinfo();?>' > index.php
cd /
chown www-data:www-data /var/www/html/chez-sgrondin -R
chmod -R -wx,u+rwX,g+rX,o+rX /var/www/html/chez-sgrondin

# PHP MyAdmin
cd /var/www/html/
wget https://files.phpmyadmin.net/phpMyAdmin/5.1.0/phpMyAdmin-5.1.0-all-languages.tar.gz
tar xfz phpMyAdmin-5.1.0-all-languages.tar.gz
mv phpMyAdmin-5.1.0-all-languages php-myadmin
rm phpMyAdmin-5.1.0-all-languages.tar.gz

service nginx start
service php7.3-fpm start

bash
# service mysql start