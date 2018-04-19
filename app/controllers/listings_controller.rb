class ListingsController < ApplicationController
	before_action :check_user
	before_action :check_admin
	def index
		@listing = Listing.order(:name).page(params[:page])
		@smoking = Listing.where(smoking_allowed:true).page(params[:page])
	end

	def show
		@listing = Listing.find(params[:id])
	end

	def new
		@new_list = current_user.listings.new
	end	

	def create
		@new_list = current_user.listings.new(allowed_params)
			if @new_list.save
				redirect_to "/users/#{current_user.id}"
			else
				render "new"
			end
	end

	def edit
		@listings = Listing.find(params[:id])	
	end

	def update
		@listings = Listing.find(params[:id])
			if @listings.update_attributes(allowed_params)
			@listings.update(edit_params)
				redirect_to "/users/#{current_user.id}"
			else
				render "new"
			end		
	end

	def destroy
		@listing = Listing.find(params[:id])
		@listing.destroy	
		redirect_to "/users/#{current_user.id}"
	end

	private
		def allowed_params
		params.require(:listing).permit(:name, :property_type, :room_number, :bed_number, :guest_number, :country, :state, :city, :zipcode, :address, :price, :description, :user_id, :smoking_allowed, :avatar)
		end

	private
		def edit_params
		params.require(:listing).permit(:avatar)
		end

	def check_user
		if !current_user
			flash[:notice] = "Sorry, please sign in to continue!"
			redirect_to sign_in_path
		end 
	end

	def check_admin
		if current_user.admin
			redirect_to admin_index_path
		end
	end
end
