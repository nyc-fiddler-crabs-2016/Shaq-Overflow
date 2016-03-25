class UsersController < ApplicationController

  before_action :ensure_current_user, except: [:new, :create, :show]
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash.alert = "Woops."
      redirect_to new_user_path
    end

  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def edit
    @user = User.find_by(id: params[:id])
    unless @user == current_user
      flash.alert = "Nope."
      redirect_to login_path
    end
  end

  def update
    @user = User.find_by(id: params[:id])
    unless @user == current_user
      flash.alert = "Try again."
      redirect_to login_path
    end
    @user.update(user_params)
    redirect_to @user
  end

  def destroy

  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :email)
  end


end
