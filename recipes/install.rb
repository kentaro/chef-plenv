include_recipe "default"

node.plenv.users.each do |name|
  node.plenv.versions.each do |version|
    plenv_perl version do
      action :install
      install_options node.plenv.install_options unless node.plenv.install_options.empty?
    end
  end
end
