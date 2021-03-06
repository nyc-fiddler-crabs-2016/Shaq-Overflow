class SessionController < ApplicationController

  before_action :ensure_current_user, except: [:new, :create, :destroy]
  def new
    render '_new'
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash.alert = 'Incorrect login info.'
      redirect_to :back
    end
  end

  def destroy
    session.clear
    redirect_to "/"
  end

end
