%w[build-essential git].each do |cookbook|
  include_recipe cookbook
end

node.plenv.users.each do |user|
  name = user["name"] || next

  git "plenv" do
    user        name
    repository  node.plenv.repository
    reference   node.plenv.reference
    destination "#{node.plenv.user_home_root}/#{name}/.plenv"
    action      :sync
  end

  user_profile = node.plenv.user_profile_template % name

  bash "Add $PATH to plenv into #{user_profile}" do
    user name
    code <<-COMMAND
echo '
export PATH="\$HOME/.plenv/bin:$PATH"
eval "\$(plenv init -)"
' >> #{user_profile}
COMMAND
    not_if {
      begin
        File.open(user_profile).read.match(/plenv init/)
      rescue
        false
      end
    }
  end
end
