include_recipe "default"

node.plenv.users.each do |name|
  node.plenv.versions.each do |version|
    plenv_perl version do
      action :install
      user   name
      install_options node.plenv.install_options
    end
  end
end
