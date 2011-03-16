class User < ActiveRecord::Base
	require 'role_model'
	# attr_accessor :roles_mask # in real life this would be an persisted attribute

    include RoleModel

    # optionally set the integer attribute to store the roles in,
    # :roles_mask is the default
    roles_attribute :roles_mask

    # declare the valid roles -- do not change the order if you add more
    # roles later, always append them at the end!
    roles :admin, :manager, :user
	acts_as_authentic do |c|
	      # c.my_config_option = my_value # for available options see documentation in: Authlogic::ActsAsAuthentic
	    end # block optional
	# acts_as_authorization_subject  :association_name => :roles
	

end
