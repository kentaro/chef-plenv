name             "plenv"
maintainer       "Kentaro Kuribayashi"
maintainer_email "kentarok@gmail.com"
license          "MIT"
description      "Chef cookbook and LWRPs for plenv"
long_description IO.read(File.join(File.dirname(__FILE__), "README.md"))
version          "0.0.2"

%w[git build-essential].each do |cookbook|
  depends cookbook
end
