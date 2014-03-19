class Member < ActiveRecord::Base
	attr_accessor :enable_strict_validation

	has_many :blogs, :dependent => :destroy
	has_one :member_detail, foreign_key: "member_id", inverse_of: :member, :dependent => :destroy


  	accepts_nested_attributes_for :member_detail

#    attr_accessible :password, password
	before_save :set_password
#	before_save :picture_upload_save
    mount_uploader :image, ImageUploader

    after_create :set_password, :send_mail_on_registration 
    validates_confirmation_of :password



	def set_password
		self.password = Digest::SHA1.hexdigest("#{self.password}")
	end

	def send_mail_on_registration
#		MyMailer.welcome_email('milap@virtueinfo.com','just checking').deliver
	end

=begin
	def picture_upload_save()
#		upload = "#{self.profile_picture}"
		name =  upload['profile_picture'].original_filename
		directory = "public/uploads/member"
		# create the file path
		path = File.join(directory, name)
		# write the file
		File.open(path, "wb") { |f| f.write(upload['profile_picture'].read) }
	end
=end
	validates :first_name,  
		presence: 
			{
			:message => "First Name is required"
			}, 
		length: { minimum: 5,
			  maximum: 10,
			  too_short: "First Name must have at least %{count} words",
			  too_long: "First Name must have at most %{count} words"
			}

	validates :last_name, 
		presence:  
			{
			:message => "Last Name is required"
			}

	validates :username,  :if => :enable_strict_validation,
			  :uniqueness => 
					{
					message: "%{value} already Existed!"
					},
		presence: 
			{
			:message => "Username is required"
			}
	
	validates :email, 
			  :uniqueness => 
					{
					message: "'%{value}' already Existed!"
					},
		presence: 
			{
			:message => "Email is required"
			},
		 format: 
			{ 
			with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i,
			:message => "Email is invalid"
			}
	validates_presence_of :password, :on => :create,  :if => :enable_strict_validation
	validates_presence_of :password_confirmation, :on => :create,  :if => :enable_strict_validation

	def memberlogin
		validates_presence_of :username
	end
end	
