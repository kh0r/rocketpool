```bash
# Install deps
pip install ansible hcloud
ansible-galaxy collection install hetzner.hcloud community.general
ansible-galaxy install dev-sec.os-hardening dev-sec.ssh-hardening jnv.unattended-upgrades geerlingguy.docker

# Use vagrant environment (or dev or prod)
./env.sh vagrant

# Create vagrant machine (or hetzner.yaml or manually add your own hosts) and do base provisioning
ansible-playbook vagrant.yaml base.yaml

# Install and setup rocketpool + monitoring (remember to set HCLOUD_TOKEN when using hetzner)
ansible-playbook install-rocketpool.yaml
```

### Provision NUC
```bash
# Install Debian - https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/
# Burn to SD Card
# Start install, press ESC and type `auto url=<host-of-preseed>:8000/preseed.cfg`

# Format the ssd?
#fsck.ext4 /dev/disk/by-partuuid/ba8553b0-ca53-4570-bfa2-9ba6ba77016b
echo "/dev/disk/by-partuuid/ba8553b0-ca53-4570-bfa2-9ba6ba77016b /var/lib/fast ext4 rw,relatime,stripe=8191 0 0" >> /etc/fstab
```
### TODO
- Finish the node - see [this](https://rocket-pool.readthedocs.io/en/latest/smart-node/introduction.html#introduction)
  - recover with wallet mnemonics
  - upgrade?