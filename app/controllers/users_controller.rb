class UsersController < ApplicationController
  before_action :authorize, except: [:new, :create]
  before_action :check_user, except: [:new, :create, :index]
  
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
        session[:user_id] = @user.id
        flash[:success] = "Signup Successful!"
        redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    
    if @user.update_attributes(user_params)
      
      flash[:success] = "Profile successfully updated"
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = "User successfully destroyed."
    redirect_to root_path
  end
  
  private
  
  def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :role)
  end
  
  def check_user
    @user = User.find(params[:id])
    
    unless @user == current_user
      redirect_to current_user
    end
  end
end
