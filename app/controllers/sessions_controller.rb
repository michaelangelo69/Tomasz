class SessionsController < ApplicationController
  def new
  end
  def create
    @user = User.where(:email => params[:session][:email].downcase).first
    if @user && @user.authenticate(params[:session][:password_digest])
      	session[:user_id] = @user.id
      	redirect_to '/users'
    else
      redirect_to 'login'
    end
  end
  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end
end
