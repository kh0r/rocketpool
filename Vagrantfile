Vagrant.configure("2") do |config|

    config.vm.provider "virtualbox" do |v|
      v.memory = 16384
      v.cpus = 12
    end
    
    config.vm.define "rocketpool-miner"
    config.vm.box = "debian/buster64"
    #config.vm.network "forwarded_port", guest: 3000, host: 3000
    
    config.vm.synced_folder '.', '/vagrant', disabled: true
    
    config.vm.provision "shell", inline: <<-SHELL
      adduser admin --disabled-password --gecos ""
      echo "admin ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/admin
      sudo -u admin mkdir -m700 /home/admin/.ssh
      sudo -u admin echo \"#{ENV['PUBLIC_SSH_KEY']}\" > /home/admin/.ssh/authorized_keys
      chown admin:admin /home/admin/.ssh/authorized_keys
      sudo -u admin chmod 600 /home/admin/.ssh/authorized_keys
    SHELL
  end