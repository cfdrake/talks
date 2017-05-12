#!/usr/bin/env bash

# NOTE: Assumes that inventory is copied to /usr/local/etc/ansible/hosts
# Otherwise, you can use '-i inventory' to reference local copy
# Also assumes server has Python and local computer has Ansible.
# Do `brew install ansible` for macOS client.

# Local connection - running FROM my box.
ansible local-and-remote -c local -m ping

# Remote connection - SSH login with keypair authentication.
ansible remote -u colin -a 'echo Hello Remote Box'

# Run some roles/modules.
# What happens if you run it twice?
ansible remote -u root -m apt -a "name=nginx state=latest"

# Cool! Now let's try out a playbook to do something real!
ansible-playbook -u root main.yml
