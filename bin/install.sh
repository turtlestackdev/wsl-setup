#!/usr/bin/env sh

python3 -m pip -V
if [ $? -ne 0 ]; then
    sudo apt-get update
    sudo apt-get install python3-pip
fi
sudo python3 -m pip install ansible
ansible-playbook playbooks/main.yml
