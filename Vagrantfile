# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  config.vm.box       = "centos-6.3"
  config.vm.box_url   = "http://developer.nrel.gov/downloads/vagrant-boxes/CentOS-6.3-x86_64-v20130101.box"

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ["../"]
    chef.add_recipe("chef-plenv")

    chef.json = {
      :versions => ["5.16.3"],
      :users    => ["vagrant"],
    }
  end
end
