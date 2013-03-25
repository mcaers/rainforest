class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create 
		@user = User.new(params[:user])
		if @user.save
			# flash[:notice]
			# flash[:alert]
			# flash[:error]
			flash[:notice] = "Signup was successful"
			redirect_to products_path
		else
			render :action => :new
		end

	end

end
