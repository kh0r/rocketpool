```bash
# Install deps
pip install ansible hcloud
ansible-galaxy collection install hetzner.hcloud community.general
ansible-galaxy install dev-sec.os-hardening dev-sec.ssh-hardening jnv.unattended-upgrades geerlingguy.ntp geerlingguy.docker

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
# TODO: create some kind of preseed image to automate the rest
# Install with SSH server
adduser admin --disabled-password --gecos ""
echo "admin ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/admin
sudo -u admin mkdir -m700 /home/admin/.ssh
sudo -u admin echo "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJhhN9UwN0AJ+PDVxie5aEN6jY+/J0UGakjOHpXT283l" >> /home/admin/.ssh/authorized_keys
chown admin:admin /home/admin/.ssh/authorized_keys
sudo -u admin chmod 600 /home/admin/.ssh/authorized_keys

# Format the ssd?
#fsck.ext4 /dev/disk/by-partuuid/ba8553b0-ca53-4570-bfa2-9ba6ba77016b
echo "/dev/disk/by-partuuid/ba8553b0-ca53-4570-bfa2-9ba6ba77016b /var/lib/fast ext4 rw,relatime,stripe=8191 0 0" >> /etc/fstab
```
### TODO
- Finish the node - see [this](https://rocket-pool.readthedocs.io/en/latest/smart-node/introduction.html#introduction)
  - recover with wallet mnemonics
  - upgrade?