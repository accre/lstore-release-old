# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "centos64_64_melo1"
  config.vm.box_url = "https://se1.accre.vanderbilt.edu:8080/file-read/centos_64_x64_v1.box"
  config.vm.box_download_insecure = true

  config.vm.define :default do |default|
    default.vm.hostname = 'lstore-default.local'
    default.vm.provision :shell, :path => "scripts/bootstrap-devvm.sh"
  end
end
