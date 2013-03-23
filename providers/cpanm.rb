action :install do
  converge_by("Install #{new_resource.name} via cpanm") do
    bash "cpanm #{new_resource.name}" do
      user        new_resource.user
      environment "HOME" => "#{node.plenv.user_home_root}/#{new_resource.user}",
                  "PLENV_VERSION" => new_resource.version
      path        [
        "#{node.plenv.user_home_root}/#{new_resource.user}/.plenv/bin",
        "#{node.plenv.user_home_root}/#{new_resource.user}/.plenv/shims",
      ]

      # `path` option seems to not work correctly...
      code <<-COMMAND
#{node.plenv.user_home_root}/#{new_resource.user}/.plenv/shims/cpanm #{new_resource.options} #{new_resource.name} &&
#{node.plenv.user_home_root}/#{new_resource.user}/.plenv/bin/plenv rehash
COMMAND
    end
  end
end

def whyrun_supported?
  true
end
