include_recipe "plenv"

node["plenv"]["users"].each do |user|
  name     = user["name"]     || next
  gname    = user["group"]    || next
  versions = user["versions"] || next

  versions.each do |version|
    plenv_install version["version"] do
      user            name
      group           gname
      install_options version["install_options"] || ""
      action          :install
    end
  end
end
