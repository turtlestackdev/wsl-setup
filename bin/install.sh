#!/usr/bin/env sh

python3 -m pip -V
if [ $? -ne 0 ]; then
    sudo apt-get update && apt-get install pip3
fi
python3 -m pip install --user ansible
ansible-playbook playbooks/main.yml --check
