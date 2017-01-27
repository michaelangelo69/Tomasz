class UsersController < ApplicationController
before_action :set_user, only: [:show]

def index
  @users = User.all
end

def show
end

def new
  @user = User.new
end

def create
  @user = User.new(user_params)
  @user.password_digest = BCrypt::Password.create(@user.password_digest)
  if @user.save
    session[:user_id] = @user.id
    redirect_to '/users'
  else
    redirect_to '/signup'
  end
end

private
  def user_params
    params.require(:user).permit(:email, :password_digest, :first_name, :last_name)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
