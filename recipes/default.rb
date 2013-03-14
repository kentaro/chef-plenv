node.plenv.install_pkgs.each do |name|
  package name do
    action :install
  end
end

node.plenv.users do |name|
  execute "plenv" do
    repository  node.plenv.repository
    reference   node.plenv.reference
    action      :sync
    destination "#{node.plenv.user_home_root}/#{name}/.plenv"
    user        name
    not_if { Dir.exists("#{node.plenv.user_home_root}/#{name}/.plenv") }
  end

  user_profile = node.plenv.user_profile_template % name

  bash "Add $PATH to plenv into #{user_profile}" do
    user name
    code <<-COMMAND
echo '
export PATH="\$HOME/.plenv/bin:$PATH"
eval "\$(plenv init -)"
' >> #{user_profile} && exec $SHELL -l
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
