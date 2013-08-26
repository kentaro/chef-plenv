action :run do
  converge_by("Set perl version #{new_resource.name} being used globally") do
    bash "plenv global #{new_resource.name}" do
      user        new_resource.user
      group       new_resource.group
      environment "HOME" => "#{node["plenv"]["user_home_root"]}/#{new_resource.user}"
      path        ["#{node["plenv"]["user_home_root"]}/#{new_resource.user}/.plenv/bin"]

      # `path` option seems to not work correctly...
      code <<-COMMAND
#{node["plenv"]["user_home_root"]}/#{new_resource.user}/.plenv/bin/plenv global #{new_resource.name}
COMMAND
    end
  end
end

def initialize(*args)
  super
  @action = :run
end

def whyrun_supported?
  true
end
