class User < ApplicationRecord

		EMAIL_REGEXP = /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/
		validates_presence_of	:email,	:full_name,	:location,	:password
		validates_length_of	:bio,	minimum:	30,	allow_blank: false
		validates_format_of :email, with: EMAIL_REGEXP
		
		has_secure_password	
end
