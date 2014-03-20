class Admin < ActiveRecord::Base


validates :username,
	presence: 
		{
		:message => "Username is required"
		}

validates :password,
	presence: 
		{
		:message => "Password is required"
		}

=begin
	def check_adminlogin_isvalid(requestparameter)
		ssHasErrorMessage = {}
		ssHasErrorMessage['error'] = 'No'

		if requestparameter['username'] == ''
			ssHasErrorMessage['username'] = 'Username can not be blank'
			ssHasErrorMessage['error'] = 'Yes'
		end

		if requestparameter['pasword'] == ''
			ssHasErrorMessage['pasword'] = 'Passeord can not be blank'
			ssHasErrorMessage['error'] = 'Yes'
		end
	
		if requestparameter['username'] != '' && requestparameter['pasword'] != ''
			oAdmin = Admin.where(username: requestparameter['username'])
			
			if oAdmin.length == 0
				ssHasErrorMessage['username'] = 'Wrong Authentications'
			else

	
#				Rails.logger.debug oAdmin.inspect
			end

		end

	end
=end

end
