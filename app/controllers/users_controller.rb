class UsersController < ApplicationController
  def index
    @users = User.all
  end
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to '/users'
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to '/users/new'
    end
  end
  def show
    @user = User.find(params[:id])
    puts @user
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to "/users"
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to "/users/#{@user.id}/edit"
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email_address, :password)
  end
end
