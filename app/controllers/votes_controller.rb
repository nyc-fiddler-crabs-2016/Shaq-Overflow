class UsersController < ApplicationController

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



  def update
    @user = User.find_by(id: params[:id])
    unless @user == current_user
      flash.alert = "Try again."
      redirect_to login_path
    end
    @user.update(user_params)
    redirect_to @user
  end

  private

  def vote_params
    params.require(:user).permit(:username, :password, :email)
  end


end
