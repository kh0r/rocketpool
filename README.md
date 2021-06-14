```bash
# Install deps
pip install ansible hcloud
ansible-galaxy collection install hetzner.hcloud community.general
ansible-galaxy install dev-sec.os-hardening dev-sec.ssh-hardening jnv.unattended-upgrades geerlingguy.ntp geerlingguy.docker

# Use vagrant environment (or dev or prod)
./env.sh vagrant

# Create vagrant machine (or hetzner.yaml) and do base provisioning
ansible-playbook vagrant.yaml base.yaml

# Install and setup rocketpool (remember to set HCLOUD_TOKEN when using hetzner)
ansible-playbook install-rocketpool.yaml --ask-vault-pass
```

### TODO
- Switch to [pocket](https://github.com/rocket-pool/smartnode-install/blob/458d6e46e19ed4a4165f36f77af76d83647ea755/amd64/rp-smartnode-install/network/pyrmont/config.yml#L71) with the Prater testnet launch
- Finish the node - see [this](https://rocket-pool.readthedocs.io/en/latest/smart-node/introduction.html#introduction)
  - recover with wallet mnemonics
  - upgrade?
- script/document SSH tunnel to access monitoring