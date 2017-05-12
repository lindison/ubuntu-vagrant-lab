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

10.0.22.10 node-0
10.0.22.11 node-1
10.0.22.12 node-2

EOL
