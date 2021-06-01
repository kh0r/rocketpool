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
ansible-playbook rocketpool.yaml --ask-vault-pass
```

### TODO
- Switch to [pocket](https://github.com/rocket-pool/smartnode-install/blob/458d6e46e19ed4a4165f36f77af76d83647ea755/amd64/rp-smartnode-install/network/pyrmont/config.yml#L71) with the Prater testnet launch
- hardware?
    - https://www.netcup.eu/bestellen/produkt.php?produkt=2604 <--- seems nice like most value for money.
    - https://contabo.com/en/vps/vps-xl-ssd/
    - inspiration: https://github.com/rel0aded/ansible-role-rocket-pool