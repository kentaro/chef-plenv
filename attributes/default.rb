default.set["plenv"]["versions"]        = %w["5.16.3"]
default.set["plenv"]["users"]           = []
default.set["plenv"]["install_options"] = ""
default.set["plenv"]["repository"]      = "git://github.com/tokuhirom/plenv.git"
default.set["plenv"]["reference"]       = "master"

case platform
when "redhat","centos","fedora", "amazon", "scientific"
  node.set['plenv']['install_pkgs']         = %w[git]
  default.set['plenv']['user_home_root']        = '/home'
  default.set['plenv']['user_profile_template'] = '/home/%s/.bash_profile'
when "debian","ubuntu","suse"
  node.set['plenv']['install_pkgs']         = %w[git-core]
  default.set['plenv']['user_home_root']        = '/home'
  default.set['plenv']['user_profile_template'] = '/home/%s/.profile'
end
