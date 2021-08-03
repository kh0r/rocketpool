Vagrant.configure("2") do |config|

    config.vm.provider "virtualbox" do |v|
      v.memory = 16384
      v.cpus = 8
    end
    
    config.vm.define "rocketpool-miner"
    config.vm.hostname = "vagrant-rp-node"
    config.vm.box = "debian/buster64"
    config.vm.network "forwarded_port", guest: 30303, host: 30303, protocol: "tcp", id: "eth1 (tcp)"
    config.vm.network "forwarded_port", guest: 30303, host: 30303, protocol: "udp", id: "eth1 (udp)"
    config.vm.network "forwarded_port", guest: 9001, host: 9001, protocol: "tcp", id: "eth2 (tcp)"
    config.vm.network "forwarded_port", guest: 9001, host: 9001, protocol: "udp", id: "eth2 (udp)"
    config.vm.network "forwarded_port", guest: 3000, host: 3000, protocol: "tcp", id: "grafana"
    
    config.vm.synced_folder '.', '/vagrant', disabled: true
    
    config.vm.provision "shell", inline: <<-SHELL
      adduser ted --disabled-password --gecos ""
      echo "ted ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/ted
      sudo -u ted mkdir -m700 /home/ted/.ssh
      sudo -u ted echo \"#{ENV['PUBLIC_SSH_KEY']}\" > /home/ted/.ssh/authorized_keys
      chown ted:ted /home/ted/.ssh/authorized_keys
      sudo -u ted chmod 600 /home/ted/.ssh/authorized_keys
    SHELL
  end