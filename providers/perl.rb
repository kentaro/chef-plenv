action :install do
  executor = bash "Install #{new_resource.name}" do
    user   new_resource.user
    code   "plenv install #{new_resource.name} #{new_resource.install_options}"
    action :nothing
  end

  executor.run_action(:run)
  new_resource.updated_by_last_action(true)
end

def whyrun_supported?
  true
end
