actions :run
default_action :run if defined?(default_action)

attribute :version, :kind_of => String, :name_attribute => true
attribute :user,    :kind_of => String
attribute :group,   :kind_of => String
