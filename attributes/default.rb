# `users` hash can be the form below:

# users: [
#   {
#     name:  "kentaro",
#     group: "staff",
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
default["plenv"]["repository"] = "git://github.com/tokuhirom/plenv.git"
default["plenv"]["reference"]  = "master"
default["plenv"]["build_repository"] = 'git://github.com/tokuhirom/Perl-Build.git'
default["plenv"]["build_reference"]  = "master"

case platform
when "redhat", "centos", "fedora", "amazon", "scientific"
  default['plenv']['user_home_root']        = '/home'
  default['plenv']['user_profile_template'] = '/home/%s/.bash_profile'
when "debian", "ubuntu"
  default['plenv']['user_home_root']        = '/home'
  default['plenv']['user_profile_template'] = '/home/%s/.profile'
end
