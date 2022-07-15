Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/jammy64"
  config.vm.network "forwarded_port", guest: 80, host: 4242

  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
  end

  config.vm.provision "shell", inline: <<-SHELL
    sudo apt-get update -y
    sudo apt-get install -y puppet
    echo "To execute puppet run inside VM: sudo puppet apply /vagrant/manifest.pp"
  SHELL
end
