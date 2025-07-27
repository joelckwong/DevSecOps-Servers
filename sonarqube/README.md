We will install Sonarqube 10.x LTS

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
echo "vm.max_map_count=262144" | sudo tee -a /etc/sysctl.conf
sudo sysctl -p /etc/sysctl.conf
git clone https://github.com/joelckwong/DevSecOps-Servers.git
cd DevSecOps-Servers/sonarqube
sudo mkdir -p /data/sonarqube_data /data/sonarqube_logs /data/postgresql_data
sudo chown 1000:1000 /data/sonarqube_data /data/sonarqube_logs
sudo chown 999:999 /data/postgresql_data
docker compose up -d
```
In the web browser go to https://FQDN
login as admin and use the password above
