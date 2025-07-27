We will install Jenkins 2.x LTS

In this example, we are installing on RHEL8 VM.  I've already created the self signed certs using the command below:
create self-signed cert with "openssl req -new -x509 -newkey rsa:4096 -nodes -out nginx/nginx-selfsigned.crt -keyout nginx/nginx-selfsigned.key -days 3650 -subj "/C=US/ST=Massachusetts/L=Boston/O=example/OU=example/CN=example"
```
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo dnf -y module enable container-tools
sudo dnf -y install docker-ce --allowerasing
sudo systemctl start docker && sudo systemctl enable docker
sudo usermod -aG docker $LOGNAME
newgrp docker
git clone https://github.com/joelckwong/DevSecOps-Servers.git
cd DevSecOps-Servers/jenkins
sudo mkdir -p /data/jenkins_home /data/mariadb
sudo chmod -R 755 /data
sudo chown 1000:1000 /data/jenkins_home
sudo chown 999:9999 /data/mariadb
docker compose up -d
sudo firewall-cmd --permanent --add-port=443/tcp
sudo firewall-cmd --reload
sudo firewall-cmd --list-ports
docker exec -it jenkins cat /var/jenkins_home/secrets/initialAdminPassword
```
Login to https://FQDN
