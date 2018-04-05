class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
	end

# private
# 	def allowed_params
# 		params.require().permit(:description)
# 	end

end
