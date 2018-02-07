class UsersController < ApplicationController
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Stylish Style Shop #{@user.username}"
      redirect_to articles_path
    else
      render 'signup'
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "You had successfully updated your profile"
      redirect_to articles_path
    else
      render 'edit'
    end
  end
  
  def show 
    @user = User.find(params[:id])
  end
  
  private
  
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
  
end