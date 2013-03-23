node["plenv"]["users"].each do |user|
  name     = user["name"]     || next
  versions = user["versions"] || next

  versions.each do |version|
    plenv_install version["version"] do
      user            name
      install_options version["install_options"] || ""
      action          :install
    end
  end
end
