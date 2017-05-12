
# Generate new SSH Key
ssh-keygen -f /root/.ssh/id_rsa -t rsa -b 2048 -N ''

# Install Packages
apt-get update
apt-get install -y tree ansible sshpass

# Setup Ansible Hosts
touch /etc/ansible/hosts
cat >> /etc/ansible/hosts <<EOL

[workers]
node-1
node-2

[all:vars]
ansible_ssh_user=ubuntu
ansible_ssh_pass=vagrant

EOL

# Define .ssh/known_hosts
cp /vagrant/ansible.sh /root/
ssh-keyscan node-0 >> /root/.ssh/known_hosts
ssh-keyscan node-1 >> /root/.ssh/known_hosts
ssh-keyscan node-2 >> /root/.ssh/known_hosts

cat /root/.ssh/id_rsa.pub >> /root/.ssh/authorized_keys
ansible node-1 -s -m file -a "path=/root/.ssh/ state=directory"
ansible node-1 -s -m copy -a "src=/root/.ssh/authorized_keys dest=/root/.ssh/authorized_keys owner=root group=root mode=644"
ansible node-2 -s -m file -a "path=/root/.ssh/ state=directory"
ansible node-2 -s -m copy -a "src=/root/.ssh/authorized_keys dest=/root/.ssh/authorized_keys owner=root group=root mode=644"

# Install HTOP
apt-get install htop -y
# end
