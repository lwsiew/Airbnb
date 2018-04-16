class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
		@user_listing = @user.listings
		@user_reservation = @user.reservations
	end

	def create
	end

	def update
		@user = User.find(params[:id])
		@user.update(edit_params)
		redirect_to @user
	end

	private
	def edit_params
		params.require(:user).permit(:avatar)
	end
end
