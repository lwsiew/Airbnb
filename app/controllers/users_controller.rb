class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
		@user_listing = @user.listings
	end


end
