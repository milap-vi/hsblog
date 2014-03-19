class MemberLogin < Member

validates_presence_of  :username, :password


validates :username, 
	presence: true, 
	:presence => { :message => "Username is required!" }

validates :password, 
	presence: 
		{
		:message => "Password is required!"
		}

=begin
def validate_each (record, attribute, value)
	record.errors[attribute] << "String must be 7 characters exactly"
end

=end

end
