class AdminController < ApplicationController
	before_action :check_user
	before_action :check_admin
	def index
		@listing = Listing.all
	end

	def show
		@listing = Listing.find(params[:id])
	end

	def check_user
		if !current_user
		redirect_to root_path, notice: "No trespassing. Trespasser will be prostituted."
		end
	end

	def check_admin
		if !current_user.admin
		redirect_to root_path, notice: "No trespassing. Trespasser will be prostituted."
		end
	end
end
