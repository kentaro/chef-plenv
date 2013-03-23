include_recipe "plenv::install_cpanm"

node.plenv.users.each do |user|
  name     = user["name"]     || next
  versions = user["versions"] || next

  versions.each do |version|
    modules = version["modules"] || next
    opts    = version["cpanm_options"] || ""

    modules.each do |mod|
      plenv_cpanm mod do
        user    name
        options opts
        action :install
      end
    end
  end
end
