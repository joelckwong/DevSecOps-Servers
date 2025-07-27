We will install Jenkins 2.x LTS

In this example, we are installing on RHEL8 VM.  I've already created the self signed certs using the command below:
create self-signed cert with "openssl req -new -x509 -newkey rsa:4096 -nodes -out nginx/nginx-selfsigned.crt -keyout nginx/nginx-selfsigned.key -days 3650 -subj "/C=US/ST=Massachusetts/L=Boston/O=example/OU=example/CN=example"
```
git clone https://github.com/joelckwong/DevSecOps-Servers.git
sudo mkdir -p /data/jenkins_home /data/mariadb
sudo chown 1000:1000 /data/jenkins_home
sudo chown 999:9999 /data/mariadb
docker compose up -d
sudo firewall-cmd --permanent --add-port=443/tcp
sudo firewall-cmd --reload
sudo firewall-cmd --list-ports
docker exec -it jenkins cat /var/jenkins_home/secrets/initialAdminPassword
```
Login to https://FQDN
