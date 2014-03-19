class MemberSignin

@@hmemberloginparams = {}

include ActiveModel::Validations # Only inject validation features of models
attr_accessor :username, :password


 
def self.validates_fields_not_blank(*attrs)
	validates_each attrs do |record, attr, value|
		if value.blank?
		record.errors.add attr, "#{attr} can not be blank".camelize
		else

=begin
			if attr == 'username' && !Member.where(username: :username)
				record.errors.add attr, "This user is not existed in db".camelize
			end
=end

		end

		

	end
end

=begin
def self.check_username_registered(*attrs)


end
def username_required?
	@username_required
end


=end
 
validates_fields_not_blank :username, :password
#check_username_registered :username, :if => :username != nil, :if => :password != nil


def initialize(username, password)
	@username, @password = username, password
end



def check_username_password(username,password)
	oMember = Member.where(username: username)

	if oMember.count == 0
		@@hmemberloginparams["error"] = "Username is not existed in System!"

	end

	if oMember.first.password == Digest::SHA1.hexdigest(password)
		@@hmemberloginparams["username"] = oMember.first.username
		@@hmemberloginparams["email"] = oMember.first.email
		@@hmemberloginparams["error"] =  ''
	else
		@@hmemberloginparams["error"] = "Password not matched!"
	end

	@@hmemberloginparams.to_hash

end


end
