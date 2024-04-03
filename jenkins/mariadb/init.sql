CREATE USER 'jenkins'@'%' IDENTIFIED by 'password';
CREATE DATABASE jenkinsdb CHARACTER SET utf8 COLLATE utf8_bin;
GRANT ALL PRIVILEGES ON jenkinsdb.* TO 'jenkins'@'%';
GRANT SYSTEM USER ON *.* to 'jenkins'@'%';
FLUSH PRIVILEGES;
