```bash
# Install deps
pip install ansible hcloud
ansible-galaxy collection install hetzner.hcloud community.general
ansible-galaxy install dev-sec.os-hardening dev-sec.ssh-hardening jnv.unattended-upgrades geerlingguy.ntp geerlingguy.docker

# Use vagrant environment (or dev or prod)
./env.sh vagrant

# Create vagrant machine (or hetzner.yaml)
ansible-playbook vagrant.yaml

# Provision the host (remember to set HCLOUD_TOKEN when using hetzner)
ansible-playbook rocketpool.yaml

```

### TODO
- hardware?
    - https://www.netcup.eu/bestellen/produkt.php?produkt=2604 <--- seems nice like most value for money.
    - https://contabo.com/en/vps/vps-xl-ssd/
    - inspiration: https://github.com/rel0aded/ansible-role-rocket-pool