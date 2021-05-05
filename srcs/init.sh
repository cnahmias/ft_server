# lu AB
# mysql
service mysql start
echo "CREATE DATABASE chez_sgrondin" | mysql -u root
echo "CREATE USER 'wpuser'@'localhost' IDENTIFIED BY 'verysecurepassword'" | mysql -u root
echo "GRANT ALL ON chez_sgrondin.* TO 'wpuser'@'localhost'" | mysql -u root
echo "FLUSH PRIVILEGES" | mysql -u root

# SSH
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-ssl.key -out /etc/ssl/certs/nginx-ssl.crt -subj "/C=FR/ST=Paris/L=Île-de-France/O=42/OU=sgrondin/CN=chez-sgrondin"

# nginx
if [[ $AUTOINDEX == "off" ]]
then
	sed -i -e 's/autoindex on;/autoindex off;/g' nginx.conf # va editer nginx.conf pour mettre autoindex off à la place de on ; /g pour global soit partout ; i permet d'ecraser le fichier / e pour prendre en compte ce qui est entre quote
fi
mv nginx.conf /etc/nginx/sites-available/
ln -s /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/ # nginx.conf est accessible depuis sites-enables, mais il n'y est pas physiquement
rm -rf /etc/nginx/sites-enabled/default # elimine le fichier default sans demander de confirmation (r inutile car c'est pour recursif)

# Wordpress
wget http://wordpress.org/latest.tar.gz
tar xfz latest.tar.gz
# opt 1
mkdir /var/www/html/chez-sgrondin
cp -R wordpress/* ./var/www/html/chez-sgrondin/
mv wp-config.php ./var/www/html/chez-sgrondin/
rm -R wordpress
rm latest.tar.gz
# opt 2
mv wordpress ./var/www/html/chez-carla # cree le dossier Carla et y met le contenu de wordpress
mv wp-config.php ./var/www/html/chez-carla/
rm latest.tar.gz
# fin opt
cd /var/www/html
mkdir php
echo '<?php phpinfo();?>' > php/index.php // on cree le fichier index.php et on y ecrit la ligne phpinfo etc...
rm index.nginx-debian.html
cd /
chown www-data:www-data /var/www/html/chez-sgrondin -R
chmod -R -wx,u+rwX,g+rX,o+rX /var/www/html/chez-sgrondin ou chomd -R 

# PHP MyAdmin
cd /var/www/html/
wget https://files.phpmyadmin.net/phpMyAdmin/5.1.0/phpMyAdmin-5.1.0-all-languages.tar.gz
tar xfz phpMyAdmin-5.1.0-all-languages.tar.gz
mv phpMyAdmin-5.1.0-all-languages php-myadmin
rm phpMyAdmin-5.1.0-all-languages.tar.gz

service nginx start
service php7.3-fpm start

tail -f /var/log/nginx/access.log /var/log/nginx/error.log 
