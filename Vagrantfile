# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'berkshelf/vagrant'

Vagrant::Config.run do |config|
  config.vm.box     = "centos-6.4"
  config.vm.box_url = "http://developer.nrel.gov/downloads/vagrant-boxes/CentOS-6.4-x86_64-v20130309.box"

  config.vm.provision :chef_solo do |chef|
    chef.run_list = %w[
      recipe[plenv::install]
    ]

    chef.json = {
      :plenv => {
        :repository => "git://github.com/tokuhirom/plenv.git",
        :reference  => "master",
        :users      => [
          {
            :name     =>  "vagrant",
            :versions => [
              {
                version: "5.16.3",
              },
            ],
          }
        ],
      },
    }
  end
end
