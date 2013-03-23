include_recipe "plenv"

node.plenv.users.each do |user|
  name = user["name"] || next

  unless version = user["global"]
    versions = user["versions"]          || next
    version  = versions.first["version"] || next
  end

  plenv_global version do
    user   name
    action :run
  end
end
