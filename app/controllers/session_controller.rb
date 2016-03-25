class SessionController < ApplicationController
  def new
    render '_new'
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to :back
    else
      flash.alert = 'Incorrect login info.'
      redirect_to login_path
    end
  end

  def destroy
    session.clear
    redirect_to :back
  end

end
