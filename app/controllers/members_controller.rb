class MembersController < ApplicationController
	before_action :set_member

	# GET /members
	def index
		@members = Member.all
	end

	# GET /members/1
	def show
	end

	# GET /members/new
	def new
		@member = Member.new
	end

	# GET /members/1/edit
	def edit
	end

	# POST /members
	def create
		@member = Member.new(member_params)
		respond_to do |format|
			if @member.save
				format.html { redirect_to members_path, notice: 'Member was successfully created.' }
			else
				format.html { render :new }
			end
		end
	end

	# PATCH/PUT /members/1
	def update
		respond_to do |format|
			if @member.update(member_params)
				format.html { redirect_to members_path, notice: 'Member was successfully updated.' }
			else
				format.html { render :edit }
			end
		end
	end

	# DELETE /members/1
	def destroy
	@member.destroy
		respond_to do |format|
			format.html { redirect_to members_url, notice: 'Member was successfully destroyed.' }
		end
	end

private
	# Use callbacks to share common setup or constraints between actions.
	def set_member
		id = params[:id]
		if id != nil 
			@member = Member.find(id)
		end
	end

	# Never trust parameters from the scary internet, only allow the white list through.
	def member_params
	  params.require(:member).permit(:name, :room_id)
	end	 

end
