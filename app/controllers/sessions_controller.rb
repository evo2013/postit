class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.where(username: params[:username]).first
    # user = User.find_by(userame: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Welcome. You've logged in."
      redirect_to root_path
    else
      flash[:error] = "There is something wrong with username or password"
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You are logged out!"
    redirect_to root_path
  end
end
