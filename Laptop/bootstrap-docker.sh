# Set local password
echo "ubuntu:vagrant" | chpasswd

# Remove Docker Engine from Install
apt-get -y remove docker docker-engine

# Install some Pre-Reqs and other packages
apt-get install -y \
     git-core wget \
     apt-transport-https \
     ca-certificates \
     curl sshpass\
     software-properties-common

# Configure the GPG keys for Docker Repo
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
apt-get update
sudo apt-key fingerprint 0EBFCD88

# Add the Docker Repo to Apt-Repo
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# Install Docker 
apt-get update
apt-get install -y docker-ce
docker run hello-world
apt install -y python-pip
pip install docker-compose

# Install Node Exporter
docker run -d -p 9100:9100 \
   -v "/proc:/host/proc" \
   -v "/sys:/host/sys" \
   -v "/:/rootfs" \
   --net="host" \
   quay.io/prometheus/node-exporter \
     -collector.procfs /host/proc \
     -collector.sysfs /host/sys \
     -collector.filesystem.ignored-mount-points "^/(sys|proc|dev|host|etc)($|/)" 

# Install CAdvisor
docker container run \
  --volume=/:/rootfs:ro \
  --volume=/var/run:/var/run:rw \
  --volume=/sys:/sys:ro \
  --volume=/var/lib/docker/:/var/lib/docker:ro \
  --publish=4194:8080 \
  --detach=true \
  --name=cadvisor \
  google/cadvisor:latest

# Install Alert Manager
docker run -p 9093:9093 prom/alertmanager \
       -config.file=/etc/alertmanager/config.yml \
       -storage.path=/alertmanager

