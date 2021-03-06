class UsersController < ApplicationController
    
	def show
		@user = User.find(params[:id])
	end
	
  	def new
  		@user = User.new
  	end

  	def create
  		@user = User.new(user_params) # Не окончательная реализация!
  		if @user.save
        log_in @user
  			flash[:success] = "Welcome to the Sample App!" # временное сообщение
  			redirect_to @user # перенаправление на /user
  		else
  			render 'new'
  		end
  	end

  	private 

  	def user_params
  		params.require(:user).permit(:name, :email, :password,
  									 :password_confirmation)
  	end
end
