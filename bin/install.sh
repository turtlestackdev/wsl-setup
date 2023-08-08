#!/usr/bin/env sh

python3 -m pip -V
if [ $? -ne 0 ]; then
    sudo apt-get update
    sudo apt-get install python3-pip
fi
sudo python3 -m pip install ansible
ansible-playbook playbooks/main.yml

ssh-keygen -t ed25519

echo "The following is your public ssh key. Copy it and add it to your GitHub profile."
echo "learn more here: "
echo "https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account"
cat ~/.ssh/id_ed25519.pub