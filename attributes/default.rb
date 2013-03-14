default["plenv"] = {
  "versions"        => %w["5.16.3"],
  "users"           => [],
  "install_options" => "",

  "repository"      => "git://github.com/tokuhirom/plenv.git",
  "reference"       => "master",
}

case platform
when "redhat","centos","fedora", "amazon", "scientific"
  node.set['plenv']['install_pkgs']         = %w[git]
  default['plenv']['user_home_root']        = '/home'
  default['plenv']['user_profile_template'] = '/home/%s/.bash_profile'
when "debian","ubuntu","suse"
  node.set['plenv']['install_pkgs']         = %w[git-core]
  default['plenv']['user_home_root']        = '/home'
  default['plenv']['user_profile_template'] = '/home/%s/.profile'
end
