class MemberdetailController < ApplicationController

  def index
  end

  def show
	redirect_to members_url
  end

  def new
    @member = Member.new
	@memberdetails = @member.build_member_detail
  end

  def edit
  end

  def create


    @member = Member.new(member_params)

	@member.enable_strict_validation = false;
	@memberdetails = @member.build_member_detail(member_details_params)

    respond_to do |format|
      if @member.valid? && @memberdetails.save
        format.html { redirect_to @memberdetail_index, notice: 'Member and Member Details was successfully created.' }
        format.json { render action: 'show', status: :created, location: @memberdetail }
      else
        format.html { render action: 'new' }
        format.json { render json: @memberdetail_index.errors, status: :unprocessable_entity }
      end
    end
  end

  def update

  end

  def destroy

  end


private
	def member_params
		params.require(:member).permit(:first_name, :last_name, :email)
	end


	def member_details_params
		params['member'].require(:member_detail).permit(:address,:role) 
	
	end

=begin
  # GET /members/new
  def new

params = ActionController::Parameters.new({
    member_detail: {
      address: '123',
      description: '555-1234'
  }
})


	@member = Member.new(:username =>'fdgdfgdfg', 
    :email =>'fdgdfgdfg@gmail.com',
    :first_name =>'ddfgdfg', 
    :last_name =>'fdgdfgdfg', 
    :password =>'fdgdfgdfg',
    :password_confirmation =>'fdgdfgdfg'
	)

	@memdet = @member.build_member_detail(:address=>'dsfdfsdf')
#    @member = Member.new(topic_params)
	@memdet.save



#	@member = MemberDetail.new
#	@memdet = @member.build_member

return render text: @member.errors.inspect
	

  end


  # POST /members
  # POST /members.json
  def create



    @member = Member.new(member_params)

    respond_to do |format|
      if @member.save
        format.html { redirect_to @member, notice: 'Member was successfully created.' }
        format.json { render action: 'show', status: :created, location: @member }
      else
        format.html { render action: 'new' }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end


  private
    # Never trust parameters from the scary internet, only allow the white list through.
	def member_details_params
		params.require(:member_detail).permit!
	end


def topic_params
  # last_post_at = (:last_post_at => Time.now)
  params.require(:member).permit(
    :username =>'fdgdfgdfg', 
    :email =>'fdgdfgdfg@gmail.com',
    :first_name =>'fdgdfgdfg', 
    :last_name =>'fdgdfgdfg', 
    :password =>'fdgdfgdfg',  
    member_details_attributes: [:member_id => 29, :address=>'dsfdfsdf'] )
end

=end


end
