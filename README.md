```bash
# Install deps
ansible-galaxy collection install hetzner.hcloud community.general
ansible-galaxy install dev-sec.os-hardening dev-sec.ssh-hardening jnv.unattended-upgrades geerlingguy.ntp geerlingguy.docker

# Use vagrant (or dev or prod)
./env.sh vagrant

# Create vagrant machine (or hetzner.yaml)
ansible-playbook vagrant.yaml

# Provision with base (secure, users, docker, ntp etc)
ansible-playbook base.yaml

# TODO: install rocketpool 
```