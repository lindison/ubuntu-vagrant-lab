# Ubuntu Docker CE + Docker Swarm + Ansible 

Baseline for a lab environment for using Docker CE. This will install the following: 

node-0 as an Ansible Control Server + configure the Repos for instal Docker but not install Docker.  
node-1 thru node-x as Docker CE nodes.  

Ansible will need some additional configuration, namely in the ssh key pairs but for the most part it'll work out of the box (batteries included). If Ansible is not your thing, it's fine to configure Docker Swarm manually.  

To use, go into the correct directory (Laptop or watson), make any updates you'd like, and run `vagrant up`.  

# TODO 
Configure SSH key injections at build time  
Condigure ssh-keyscan for all nodes into authorized_keys  

## Watson (Watson is a HomeLab bit Box)

Generally, don't use this unless you have a crap load of RAM and a crap load of CPU.  
As is, this will build node-0 thru node-4 (total of five) using the 192.168.10.60 - 192.168.10.64 address space. Further, this will use physical networks. 

## Laptop (This is for general use on a laptop) 

Generally, this is what you'd like to use, it is small enough to run almost anyways (Windows, MacOS, or Linux) and uses 3 vCPUs, 3GB RAM, and about 30GBs of "thin" disk. As is, this will build node-0 thru node-2 using the 10.0.22.10 - 10.0.22.11 address space. Further, this will use a private network. 

