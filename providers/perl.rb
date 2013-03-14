action :install do
  executor "Install #{new_resource.name}"
end

def whyrun_supported?
  true
end
