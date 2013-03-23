# users: [
#   user: {
#     name: "kentaro",
#     versions: [
#       {
#         version:         "5.16.3",
#         install_options: "-Dusethreads",
#       },
#
#       ...
#
#     ]
#   },
#
#   ...
#
# ]
default["plenv"]["users"] = []

case platform
when "redhat","centos","fedora", "amazon", "scientific"
  default['plenv']['user_home_root']        = '/home'
  default['plenv']['user_profile_template'] = '/home/%s/.bash_profile'
when "debian","ubuntu","suse"
  default['plenv']['user_home_root']        = '/home'
  default['plenv']['user_profile_template'] = '/home/%s/.profile'
end

default["plenv"]["repository"] = "git://github.com/tokuhirom/plenv.git"
default["plenv"]["reference"]  = "master"
