%w[build-essential git].each do |cookbook|
  include_recipe cookbook
end
