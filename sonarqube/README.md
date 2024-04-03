We will install Sonarqube 10.x LTS

add "vm.max_map_count=524288" to /etc/sysctl.conf

sudo sysctl -p /etc/sysctl.conf

create self-signed cert with "openssl req -new -x509 -newkey rsa:4096 -nodes -out nginx/nginx-selfsigned.crt -keyout nginx/nginx-selfsigned.key -days 3650 -subj "/C=US/ST=Massachusetts/L=Boston/O=example/OU=example/CN=example"

sudo mkdir -p /data/sonarqube_data /data/sonarqube_logs /data/postgresql_data

sudo chown 1000:1000 /data/sonarqube_data /data/sonarqube_logs

sudo chown 999:999 /data/postgresql_data

docker compose up -d

https://FQDN

login as admin/admin and change password
