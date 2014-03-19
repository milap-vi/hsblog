class MembersController < ApplicationController
=begin
    before_action :set_member, only: [:show, :edit, :destroy]

	# GET /members
	# GET /members.json
	def index
		@o_members = Member.all
	end

	# GET /members/1
	# GET /members/1.json
	def show
		redirect_to "/members"
	end

  	# GET /members/new
	def new
    	@member = Member.new
  	end

	# GET /members/1/edit
	def edit
#		@member = Member.find(params[:id])
	end

 :if => :enable_strict_validation
	def update
		if(params[:id])
			@member = Member.find(params[:id])
			if @member.update(member_params)
				redirect_to "/members"
			else
				render 'edit'
			end
		else
			@member = Member.new(member_params)	
			if @member.save
				redirect_to "/members"
			else
				render 'new'
			end
		end
	
		#render text: params[:member].inspect
	end

	# DELETE /members/1
	# DELETE /members/1.json
	def destroy
		@member = Member.find(params[:id])
		@member.destroy
		respond_to do |format|
			format.html { redirect_to members_url }
			format.json { head :no_content }
		end
	end



	private
    # Use callbacks to share common setup or constraints between actions.
    def set_member
      @member = Member.find(params[:id])
    end

	def member_params
		params.require(:member).permit(:first_name, :last_name, :email, :username, :password)
	end
=end


	helper_method :sort_column, :sort_direction
  	before_action :set_member, only: [:show, :edit, :update, :destroy]

  # GET /members
  # GET /members.json
  def index

	

	@pagesize = (params[:pagesize]) ? params[:pagesize] : 5
	@pager_number = (params[:pager_number]) ? params[:pager_number] : 1

#    @o_members = Member.all.limit(@limit)
#	@o_members = Member.order(sort_column + " " + sort_direction).limit(@pagesize)
	@o_members = Member.order(sort_column + " " + sort_direction).paginate(:per_page => @pagesize, :page => @pager_number)


  end

  # GET /members/1
  # GET /members/1.json
  def show
	redirect_to members_url
  end

  # GET /members/new
  def new
    @member = Member.new
  end

  # GET /members/1/edit
  def edit
  end

  # POST /members
  # POST /members.json
  def create
    @member = Member.new(member_params)
	@member.enable_strict_validation = true;

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

  # PATCH/PUT /members/1
  # PATCH/PUT /members/1.json
  def update

#return render text: member_params
	@member.enable_strict_validation = true;
    respond_to do |format|
      if @member.update(member_params)
        format.html { redirect_to members_url, notice: 'Member was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /members/1
  # DELETE /members/1.json
  def destroy
    @member.destroy
    respond_to do |format|
      format.html { redirect_to members_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member
      @member = Member.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
	def member_params
		params.require(:member).permit!
	end

  def sort_column
    Member.column_names.include?(params[:sort]) ? params[:sort] : "first_name"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
