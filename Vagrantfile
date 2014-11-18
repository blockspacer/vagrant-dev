# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  config.vm.provider "parallels" do |parallels|
    parallels.check_guest_tools = true
  end

  # Define multiple boxes that we can use
  config.vm.define 'ubuntu', autostart: false do |ubuntu|
    ubuntu.vm.box = "parallels/ubuntu-14.04"
    ubuntu.vm.hostname = "ubuntu-1"
    ubuntu.vm.network "private_network", ip: "192.168.10.100"
  end

  config.vm.define 'centos', primary: true do |centos|
    centos.vm.box = "parallels/centos-7.0"
    centos.vm.hostname = "centos-1"
    centos.vm.network "private_network", ip: "192.168.10.101"
  end

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # If true, then any SSH connections made will enable agent forwarding.
  # Default value: false
  # config.ssh.forward_agent = true

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Enable provisioning with Ansible
  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "provisioning/site.yml"

    ansible.extra_vars = {
      host_address: "192.168.10.101"
    }
  end

end
