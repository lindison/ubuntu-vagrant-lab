
# Generate new SSH Key
ssh-keygen -f /root/.ssh/id_rsa -t rsa -b 2048 -N ''

# Install Packages
apt-get update
apt-get install -y tree ansible sshpass

# Setup Ansible Hosts
touch /etc/ansible/hosts
cat >> /etc/ansible/hosts <<EOL

[leader]
node-0

[workers]
node-1
node-2

[all:vars]
ansible_ssh_user=ubuntu
ansible_ssh_pass=vagrant

EOL

# 
copy /vagrant/ansible.sh /root/ansible.sh

# Install HTOP
apt-get install htop -y
# end
