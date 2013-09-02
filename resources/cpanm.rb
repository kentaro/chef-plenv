actions :install
default_action :install if defined?(default_action)

attribute :module,  :kind_of => String, :name_attribute => true
attribute :version, :kind_of => String
attribute :user,    :kind_of => String
attribute :group,   :kind_of => String
attribute :options, :kind_of => String
