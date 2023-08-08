# WSL Setup

This is a small ansible playbook for configuring a fresh install of WSL.

It assumes an Ubuntu environment.

To run, clone the repo, and cd into the `wsl-setup` directory.

From there run:
```shell
./bin/install.sh
```

This will install Ansible and then run the main playbook.

You will be prompted for your full name and email. These will be used to configure Git.