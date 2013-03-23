include_recipe "plenv::install"

node.plenv.users.each do |user|
  name     = user["name"]     || next
  versions = user["versions"] || next

  versions.each do |version|
    plenv_install_cpanm version do
      user   name
      action :run
    end
  end
end
