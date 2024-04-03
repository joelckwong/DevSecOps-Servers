We will install Jenkins 2.x LTS

create self-signed cert with "openssl req -new -x509 -newkey rsa:4096 -nodes -out nginx/nginx-selfsigned.crt -keyout nginx/nginx-selfsigned.key -days 3650 -subj "/C=US/ST=Massachusetts/L=Boston/O=example/OU=example/CN=example"

sudo mkdir -p /data/nexus_data

sudo chown 200:200 /data/nexus_data

docker-compose up -d

https://FQDN

login as admin and use the password below 

docker exec -it nexus cat /nexus-data/admin.password
