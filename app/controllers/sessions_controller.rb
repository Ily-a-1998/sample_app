class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)
  	if user && user.authenticate(params[:session][:password])
  		# Осуществить вход пользователя и перенаправление на страницу профиля.
  		log_in user # временные куки.
      params[:session][:remember_me] == '1' ? remember(user) : forget(user) # запомнить пользователя или забыть
      remember user 
  		redirect_to user # перенаправление /users.
  	  else
  		flash.now[:danger] = 'Invalid email/password combination' # Выдать сообщение об ошибке.
  		render 'new'
  	end
  end

  def destroy
  	log_out if logged_in?
  	redirect_to root_url
  end
end
