We will install Sonatype Nexus 3.x

In this example, we are installing on RHEL8 VM. I've already created the self signed certs using the command below: create self-signed cert with "openssl req -new -x509 -newkey rsa:4096 -nodes -out nginx/nginx-selfsigned.crt -keyout nginx/nginx-selfsigned.key -days 3650 -subj "/C=US/ST=Massachusetts/L=Boston/O=example/OU=example/CN=example"
```
umask 022
sudo systemctl stop fapolicyd
sudo systemctl disable fapolicyd
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo dnf -y module enable container-tools
sudo dnf -y install docker-ce --allowerasing
sudo systemctl start docker && sudo systemctl enable docker
sudo usermod -aG docker $LOGNAME
newgrp docker
git clone https://github.com/joelckwong/DevSecOps-Servers.git
cd DevSecOps-Servers/nexus
sudo mkdir -p /data/nexus_data
sudo chown 200:200 /data/nexus_data
docker compose up -d
sudo firewall-cmd --permanent --add-port=443/tcp
sudo firewall-cmd --reload
sudo firewall-cmd --list-ports
docker exec -it nexus cat /nexus-data/admin.password
``
In the web browser go to https://FQDN
login as admin and use the password above
