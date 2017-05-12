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

# Create the Hosts
cat >> /etc/hosts <<EOL

192.168.10.60 node-0
192.168.10.61 node-1
192.168.10.62 node-2
192.168.10.63 node-3
192.168.10.64 node-4
192.168.10.65 node-5
192.168.10.66 node-6
192.168.10.67 node-7
192.168.10.68 node-8
192.168.10.69 node-9

EOL
