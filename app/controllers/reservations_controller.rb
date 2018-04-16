class ReservationsController < ApplicationController
	
	def index
		@reservation = current_reservation
		@listing = Listing.all
		@reserved_listing = @listing.find_by(@reservation.id)
	end

	def show
	end

	def new
		@listing = Listing.find(params[:listing_id])
		@new_reservation = Reservation.new
	end

	def create
		@listing = Listing.find(params[:listing_id])
		@new_reservation = Reservation.new(allowed_params)
		@new_reservation.user_id = current_user.id
		@new_reservation.listing_id = @listing.id 
			if @new_reservation.save
				redirect_to "/users/#{current_user.id}"
			else
				render "new"
			end		
	end

	private
		def allowed_params
		params.require(:reservation).permit(:reservation_date, :user_id, :listing_id)
		end
end
