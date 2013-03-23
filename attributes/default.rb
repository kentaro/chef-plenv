# `users` hash can be the form below:

# users: [
#   user: {
#     name: "kentaro",
#     versions: [
#       {
#         version:         "5.16.3",
#         install_options: "-Dusethreads",
#         cpanm_options:   "--force",
#         moudles: %w[
#           Plack
#           Amon2
#         ],
#       },
#
#       ...
#
#     ],
#
#     global: "5.16.3",
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
