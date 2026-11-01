We will install Jenkins 2.x LTS

In this example, we are installing on RHEL9 VM.  I've already created the self signed certs using the command below:
create self-signed cert with "openssl req -new -x509 -newkey rsa:4096 -nodes -out nginx/nginx-selfsigned.crt -keyout nginx/nginx-selfsigned.key -days 3650 -subj "/C=US/ST=Massachusetts/L=Boston/O=example/OU=example/CN=example"
```
sudo systemctl stop fapolicyd
sudo systemctl disable fapolicyd
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo dnf -y module enable container-tools
sudo dnf -y install docker-ce git --allowerasing
sudo systemctl start docker && sudo systemctl enable docker
sudo usermod -aG docker $LOGNAME
newgrp docker
git clone https://github.com/joelckwong/DevSecOps-Servers.git
cd DevSecOps-Servers/jenkins
sudo mkdir -p /data/jenkins_home /data/mariadb
sudo chmod -R 755 /data
sudo chown 1000:1000 /data/jenkins_home
sudo chown 999:9999 /data/mariadb
sudo chmod 666 /var/run/docker.sock
docker compose up -d
sudo firewall-cmd --permanent --add-port=443/tcp
sudo firewall-cmd --reload
sudo firewall-cmd --list-ports
docker exec -it jenkins cat /var/jenkins_home/secrets/initialAdminPassword
```
In a web browser go to https://FQDN and use the password above

To setup Jenkins Dynamic docker agents on same host:
In Jenkins:
Go to Manage Jenkins.
Select Plugins.
Open Available Plugins.
Search for Docker.
Install Docker plugin (plugin ID: docker-plugin).
Restart Jenkins if required.

```
cd jenkins-dynamic-agent
docker build -t jenkins-agent:1.0 .
docker images | grep jenkins-agent
```

Configure Docker Cloud in Jenkins
Go to:
Manage Jenkins → Clouds → New cloud
Select Docker.
Configure the following:
Docker Cloud settings
Setting
Value
Name
docker-cloud
Docker Host URI
unix:///var/run/docker.sock
Credentials
None for local socket
Enabled
Checked
Click Test Connection.
You should see a successful connection.

Configure Docker Agent Template
Click Add Docker Template.
Configure:
Setting
Value
Labels
docker-dynamic
Name
dynamic-agent
Docker Image
jenkins-agent:1.0
Container settings
Network
jenkins_default
Mounts
type=bind,source=/var/run/docker.sock,destination=/var/run/docker.sock
Instance Capacity
3
Remote File System Root
/home/jenkins/agent
Usage
Only build jobs with matching labels
Connect method
Connect with JNLP
For the JNLP connector, configure the Jenkins URL so that the agent container can reach your controller.
For example:
text
http://jenkins:8080
Use this only if both containers share a Docker network and jenkins is the controller's network alias.
For other deployments, use the controller's reachable hostname or IP.
Pull strategy
Never pull (for local image)
Save the configuration.

Connect the jenkins-dynamic-agent-demo repository to Jenkins
In Jenkins:
Click New Item.
Enter dynamic-agent-demo.
Select Pipeline.
Click OK.
Scroll to Pipeline.
Select Pipeline script from SCM.
Select Git.
Configure:
Setting
Value
Repository URL
https://github.com/joelckwong/jenkins-dynamic-agent-demo.git
Credentials
Your GitHub credentials if private
Branch
*/main
Script Path
Jenkinsfile
Click Save.

Run the pipeline
Click Build Now.
