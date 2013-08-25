node["plenv"]["users"].each do |user|
  name = user["name"] || next
  gname = user["gname"] || next

  unless version = user["global"]
    versions = user["versions"]          || next
    version  = versions.first["version"] || next
  end

  plenv_global version do
    user   name
    group  gname
    action :run
  end
end
