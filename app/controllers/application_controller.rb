class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :is_client_application? , :is_admin_application?, :is_admin_authenticate


	def set_session_for_frontend(a_memberparams)

		a_setforsession = {}

		if a_memberparams['username'] != nil 
#			session['frontend'] = {'username' => a_memberparams['username']}
			a_setforsession['username'] = a_memberparams['username']
		end

		if a_memberparams['email'] != nil 
#			session['frontend'] = {'email' => a_memberparams['email']}
			a_setforsession['email'] = a_memberparams['email']
		end
		
		session['frontend'] = a_setforsession

		Rails.logger.debug session['frontend']
	end

	def is_client_application?
		if session['frontend'] != nil && session['frontend'].length > 0 && session['frontend']['username'] != nil
			return true
		else
			return false
		end
	end


	def is_admin_application?
		if session['admin'] != nil && session['admin']['username'] != nil
			return true
		else
			if params[:controller]+'/'+params[:action] == 'admin/admin/login'
				return true
			else
				return false
			end			
		end
	end

	def is_admin_authenticate
		if session['admin'] != nil && session['admin']['username'] != nil
			return 'Yes'
		else
			return 'No'
		end
	end



end
