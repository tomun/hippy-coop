class RoomsController < ApplicationController
	before_action :set_room

	# GET /rooms
	def index
		@rooms = Room.all
	end

	# GET /rooms/1
	def show
	end

	# GET /rooms/new
	def new
		@room = Room.new
	end

	# GET /rooms/1/edit
	def edit
	end

	# POST /rooms
	def create
		@room = Room.new(room_params)
		respond_to do |format|
			if @room.save
				format.html { redirect_to rooms_path, notice: 'Room was successfully created.' }
			else
				format.html { render :new }
			end
		end
	end

	# PATCH/PUT /rooms/1
	def update
		respond_to do |format|
			if @room.update(room_params)
				format.html { redirect_to rooms_path, notice: 'Room was successfully updated.' }
			else
				format.html { render :edit }
			end
		end
	end

	# DELETE /rooms/1
	def destroy
		@room.destroy
		respond_to do |format|
			format.html { redirect_to rooms_url, notice: 'Room was successfully destroyed.' }
		end
	end

private
	# Use callbacks to share common setup or constraints between actions.
	def set_room
		id = params[:id]
		if id != nil 
			@room = Room.find(id)
		end
	end

	# Never trust parameters from the scary internet, only allow the white list through.
	def room_params
	  params.require(:room).permit(:name, :rent, :member_id)
	end	 

end
