include_recipe "plenv"

node.plenv.users.each do |user|
  name     = user["name"]     || next
  versions = user["versions"] || next

  versions.each do |version|
    plenv_perl version["version"] do
      user            name
      install_options version["install_options"] || ""
      action          :install
    end
  end
end
