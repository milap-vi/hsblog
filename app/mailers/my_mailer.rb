class MyMailer < ActionMailer::Base
	  default from: 'milap-noreply@gmail.com'



	def welcome_email(to_email,email_body)
#		@user = user
#		@url  = 'http://example.com/login'
#		mail(to: @user.email, subject: 'Welcome to My Awesome Site')
		mail(to: to_email, body: email_body, content_type: "text/html",subject: "Test Subject")
	end

end
