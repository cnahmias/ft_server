CREATE DATABASE chez-sgrondin;
CREATE USER 'wpuser'@'localhost' IDENTIFIED BY 'verysecurepassword';
GRANT ALL ON chez-sgrondin.* TO 'wpuser'@'localhost';
FLUSH PRIVILEGES;
QUIT;