class Admin::AdminController < ApplicationController

  def login
	@admin = Admin.new
	

	

#	return render text: @admin.errors.inspect




	if params['ssSubmit'] != nil
		@admin = Admin.new(login_params)
		@admin.valid?
	else
		@admin = Admin.new
	end


=begin
	@ssHasMessage = {}


	if params['ssSubmit'] != nil
			oA = Admin.new
			@ssHasMessage = oA.check_adminlogin_isvalid(params)



			render text: @ssHasMessage.inspect
	end
=end

  end

  private
	def login_params
		params.require(:admin).permit(:username, :password)
	end


end
