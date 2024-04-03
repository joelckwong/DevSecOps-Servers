We will install Jenkins 2.x LTS

create self-signed cert with "openssl req -new -x509 -newkey rsa:4096 -nodes -out nginx/nginx-selfsigned.crt -keyout nginx/nginx-selfsigned.key -days 3650 -subj "/C=US/ST=Massachusetts/L=Boston/O=example/OU=example/CN=example"

sudo mkdir -p /data/jenkins_home /data/mariadb

sudo chown 1000:1000 /data/jenkins_home

sudo chown 999:9999 /data/mariadb

docker compose up -d

https://FQDN

docker exec -it jenkins cat /var/jenkins_home/secrets/initialAdminPassword
