# mysql
service mysql start
echo "CREATE DATABASE chez_sgrondin" | mysql -u root
echo "CREATE USER 'wpuser'@'localhost' IDENTIFIED BY 'verysecurepassword'" | mysql -u root
echo "GRANT ALL ON chez_sgrondin.* TO 'wpuser'@'localhost'" | mysql -u root
echo "FLUSH PRIVILEGES" | mysql -u root

# SSH
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-ssl.key -out /etc/ssl/certs/nginx-ssl.crt -subj "/C=FR/ST=Paris/L=Île-de-France/O=42/OU=sgrondin/CN=chez-sgrondin"

# nginx
if [[ $AUTOINDEX == "on" ]]
then
	sed -i -e 's/autoindex off;/autoindex on;/g' nginx.conf
fi
mv nginx.conf /etc/nginx/sites-available/
ln -s /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/
rm -rf /etc/nginx/sites-enabled/default

# Wordpress
wget http://wordpress.org/latest.tar.gz
tar xfz latest.tar.gz
mkdir /var/www/html/chez-sgrondin
cp -R wordpress/* ./var/www/html/chez-sgrondin/
mv wp-config.php ./var/www/html/chez-sgrondin/
rm -R wordpress
rm latest.tar.gz
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

tail -f /var/log/nginx/access.log /var/log/nginx/error.log 