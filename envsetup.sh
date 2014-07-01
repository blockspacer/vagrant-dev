#!/usr/bin/env zsh

# Source the virtualenv python environment
source venv/bin/activate

# Create some aliases
alias apb='ansible-playbook -i .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory --private-key=~/.vagrant.d/insecure_private_key -u vagrant'
