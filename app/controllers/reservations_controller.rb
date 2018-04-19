class ReservationsController < ApplicationController
	
	def index
		@reservation = Reservation.all
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
				redirect_to braintree_new_path(@new_reservation)
			else
				render "new"
			end		
	end

	private
		def allowed_params
		params.require(:reservation).permit(:check_in, :check_out, :user_id, :listing_id)
		end
end
