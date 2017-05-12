cat /root/.ssh/id_rsa.pub >> /root/.ssh/authorized_keys
ansible all -u ubuntu -s -k -m file -a "path=/root/.ssh/ state=directory"
ansible all -m copy -a "src=/root/.ssh/authorized_keys dest=/root/.ssh/authorized_keys owner=root group=root mode=644" -u ubuntu -k -s
