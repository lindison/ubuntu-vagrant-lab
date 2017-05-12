
apk add zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"echo '  alias ll="ls -la"' >> .zshrc
ssh-keygen -f id_rsa -t rsa -b 2048 -N ''
cat >> /etc/ansible/hosts <<EOL

[master]
node-1

[workers]
node-2
node-3
node-4
node-5
node-6
node-7
node-8
node-9

[all:vars]
ansible_ssh_user=vagrant
ansible_ssh_pass=vagrant

EOL

apk add ansible
cat /root/.ssh/id_rsa.pub /root/.ssh/authorized_keys
ansible all -m copy -a "src=/root/.ssh/authorized_keys dest=/root/.ssh/authorized_keys owner=root group=root mode=644" -u vagrant -k -s
ansible all -u vagrant -s -k -m file -a "path=/root/.ssh/ state=directory"
