%w[build-essential git].each do |cookbook|
  include_recipe cookbook
end

%w[curl git make].each do |pkg|
  package pkg do
    action :install
  end
end
