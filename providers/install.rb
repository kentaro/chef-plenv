action :install do
  converge_by("Install perl version #{new_resource.name} using plenv") do
    git "plenv" do
      user        new_resource.user
      group       new_resource.group
      repository  node["plenv"]["repository"]
      reference   node["plenv"]["reference"]
      destination "#{node["plenv"]["user_home_root"]}/#{new_resource.user}/.plenv"
      action      :sync
    end

    directory "#{node["plenv"]["user_home_root"]}/#{new_resource.user}/.plenv/plugins/" do
      owner new_resource.user
      group new_resource.group
      mode  0755
      action :create
    end

    git "perl-build" do
      user        new_resource.user
      group       new_resource.group
      repository  node["plenv"]["build_repository"]
      reference   node["plenv"]["build_reference"]
      destination "#{node["plenv"]["user_home_root"]}/#{new_resource.user}/.plenv/plugins/perl-build"
      action      :sync
    end

    user_profile = node["plenv"]["user_profile_template"] % new_resource.user

    bash "Add $PATH to plenv into #{user_profile}" do
      user new_resource.user
      group new_resource.group
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

    bash "plenv install #{new_resource.name}" do
      user        new_resource.user
      group       new_resource.group
      environment "HOME" => "#{node["plenv"]["user_home_root"]}/#{new_resource.user}"
      path        ["#{node["plenv"]["user_home_root"]}/#{new_resource.user}/.plenv/bin"]

      # `path` option seems to not work correctly...
      code <<-COMMAND
#{node["plenv"]["user_home_root"]}/#{new_resource.user}/.plenv/bin/plenv install #{new_resource.name} #{new_resource.install_options}
COMMAND

      not_if {
        Dir.exists?("#{node["plenv"]["user_home_root"]}/#{new_resource.user}/.plenv/versions/#{new_resource.name}")
      }
    end
  end
end

def initialize(*args)
  super
  @action = :install
end

def whyrun_supported?
  true
end
