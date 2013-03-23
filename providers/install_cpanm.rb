action :run do
  converge_by("Install cpanm for perl version #{new_resource.name}") do
    bash "plenv instal-cpanm" do
      user        new_resource.user
      environment "HOME"          => "#{node.plenv.user_home_root}/#{new_resource.user}",
                  "PLENV_VERSION" => new_resource.name
      path        ["#{node.plenv.user_home_root}/#{new_resource.user}/.plenv/bin"]

      # `path` option seems to not work correctly...
      code <<-COMMAND
#{node.plenv.user_home_root}/#{new_resource.user}/.plenv/bin/plenv install-cpanm &&
#{node.plenv.user_home_root}/#{new_resource.user}/.plenv/bin/plenv rehash
COMMAND
      creates "#{node.plenv.user_home_root}/#{new_resource.user}/.plenv/versions/#{new_resource.name}/bin/cpanm"
    end
  end
end

def whyrun_supported?
  true
end
