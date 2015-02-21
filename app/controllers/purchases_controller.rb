class PurchasesController < ApplicationController
	before_action :set_purchase
	
	# GET /purchases
	def index
		@purchases = Purchase.where(member_id:params[:member_id])
	end

	# GET /purchases/1
	def show
	end

	# GET /purchases/new
	def new
		@purchase = Member.find(params[:member_id]).purchases.new
	end

	# GET /purchases/1/edit
	def edit
	end

	# POST /purchases
	def create
		# @purchase = Purchase.new(purchase_params)
		# @purchase.member = Member.find(params[:member_id])

		@purchase = Member.find(params[:member_id]).purchases.new(purchase_params)

		respond_to do |format|
			if @purchase.save
				format.html { redirect_to members_path, notice: 'Purchase was successfully created.' }
			else
				format.html { render :new }
			end
		end
	end

	# PATCH/PUT /purchases/1
	def update
		respond_to do |format|
			if @purchase.update(purchase_params)
				format.html { redirect_to members_path, notice: 'Purchase was successfully updated.' }
			else
				format.html { render :edit }
			end
		end
	end

	# DELETE /purchases/1
	def destroy
		@purchase.destroy
		respond_to do |format|
			format.html { redirect_to members_url, notice: 'Purchase was successfully destroyed.' }
		end
	end

private
	# Use callbacks to share common setup or constraints between actions.
	def set_purchase
		id = params[:id]
		if id != nil 
			@purchase = Purchase.find(id)
		end
	end

	# Never trust parameters from the scary internet, only allow the white list through.
	def purchase_params
	  params.require(:purchase).permit(:description, :amount, :member_id)
	end	 

end
