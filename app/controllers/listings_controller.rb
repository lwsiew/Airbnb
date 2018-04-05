class ListingsController < ApplicationController
	def index
		@listing = Listing.all
	end

	def show
		@listing = Listing.find(params[:id])
	end

	private 	
		def allowed_params	
			params.require(:listing).permit(:name)	
		end
end