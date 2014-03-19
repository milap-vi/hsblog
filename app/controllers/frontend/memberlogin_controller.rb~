class Frontend::MemberloginController < ApplicationController
  def login
	@ssMessage = ''
	
#	@member = MemberSignin.new("","sssssssssss")
#	@member = Member.new(member_params)


	if(params[:ssSubmit])
	@member = MemberSignin.new(member_params[:username],member_params[:password])

#  if valid then only set session for users
		if @member.valid?
			@ssMessage = @member.check_username_password(member_params[:username],member_params[:password])

			
			if @ssMessage["error"] != nil
				set_session_for_frontend(@ssMessage)
#				session['frontend'] = { "username" => "dddddd"}
#				render text: session['frontend']['username'].inspect
			end
		end
	else
		@member = MemberSignin.new('','')
	end
  end


    # Never trust parameters from the scary internet, only allow the white list through.
	def member_params
		params.require(:member).permit(:username, :password)
	end


end
