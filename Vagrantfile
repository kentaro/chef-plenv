# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box       = "centos-6.4"
  config.vm.box_url   = "http://developer.nrel.gov/downloads/vagrant-boxes/CentOS-6.4-x86_64-v20130309.box"

  config.vm.provision :chef_solo do |chef|
    chef.run_list = %w[
      recipe[plenv::install]
    ]

    chef.json = {
      :plenv => {
        :versions              => ["5.16.3"],
        :users                 => ["vagrant"],
        :repository            => "git://github.com/tokuhirom/plenv.git",
        :reference             => "master",
        :user_home_root        => "/home",
        :user_profile_template => "/home/%s/.bash_profile",
      },
    }
  end
end
