# Rocketpool node provisioning

Some scripts for provisioning a secure rocketpool node runner

## Dependencies (ansible and plugins)

Before you start you need to install ansible and some plugins on your local machine.

```bash
pip install ansible
ansible-galaxy collection install community.general
ansible-galaxy install dev-sec.os-hardening dev-sec.ssh-hardening jnv.unattended-upgrades geerlingguy.docker
```

## Create a machine to run the node on

Choose a target machine.

### Physical hardware

```bash
# Build preseeded debian ISO by running the script in `nuc`
cd nuc
./create_preseed_iso.sh

# Burn that to USB stick and start install

# Format the disk?
#mkfs.ext4 /dev/disk/by-id/<the-id>

# automount the disk
echo "/dev/disk/by-uuid/8a7a5935-1c6a-47ad-bdba-13f0377cf61d /var/lib/fast ext4 rw,relatime,stripe=8191 0 0" >> /etc/fstab
```

### Vagrant

For local testing

```bash
ansible-playbook vagrant.yaml
```

### Hetzner

Or if you like the cloud

```bash
# Install hetzner plugins locally
pip install hcloud
ansible-galaxy collection install hetzner.hcloud

# Create the machine
ansible-playbook hatzner.yaml
```

## Set environment

```bash
# For vagrant just use ./env.sh vagrant
# For hetzner skip the <ip-of-host> (it was automatically generated)
./env.sh <environment> <ip-of-host>
```

## Provisioning

```bash
# Do base provisioning
ansible-playbook base.yaml

# Install and setup rocketpool + monitoring
ansible-playbook install-rocketpool.yaml
```

Now rocketpool should be running and syncing with the chains.
When it's done you can setup your wallet.

## TODO

- Finish the node - see [this](https://rocket-pool.readthedocs.io/en/latest/smart-node/introduction.html#introduction)
  - recover with wallet mnemonics
  - upgrade?
