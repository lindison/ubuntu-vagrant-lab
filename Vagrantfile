# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
(1..9).each do |i|
  config.vm.define "node-#{i}" do |node|
    node.vm.box = "ubuntu/yakkety64"
    node.vm.hostname = "node-#{i}"
    node.vm.provider "virtualbox" do |vb|
      vb.memory = "4096"
      vb.cpus = "1"
      vb.linked_clone = "true"
    end
#    node.vm.network "private_network", ip: "192.168.51.5#{i}"
    node.vm.network "public_network", bridge: "enp4s0f0", ip: "192.168.10.6#{i}"
    node.vm.provision :shell, path: "bootstrap-ubuntu.sh"
    node.vm.provision :shell, path: "bootstrap-zsh.sh"
    node.vm.provision :shell, path: "bootstrap-dns.sh"
  end
end

(0..0).each do |i|
  config.vm.define "node-#{i}" do |node|
    node.vm.box = "ubuntu/yakkety64"
    node.vm.hostname = "node-#{i}"
    node.vm.provider "virtualbox" do |vb|
      vb.memory = "4096"
      vb.cpus = "2"
      vb.linked_clone = "true"
    end
#    node.vm.network "private_network", ip: "192.168.51.5#{i}"
    node.vm.network "public_network", bridge: "enp4s0f0", ip: "192.168.10.6#{i}"
#    node.vm.synced_folder ".", "/vagrant", disabled: true
    node.vm.provision :shell, path: "bootstrap-ansible.sh"
    node.vm.provision :shell, path: "bootstrap-zsh.sh"
    node.vm.provision :shell, path: "bootstrap-dns.sh"
  end
end


end
