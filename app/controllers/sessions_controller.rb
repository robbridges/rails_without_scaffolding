class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice] ="logged in successfully"
      redirect_to user_path(user)
    else
      # we need to use flash now as this is not a redirect, we are displaying the message now so that it doesn't persist until the next http request
      flash.now[:alert] = "There was something with your login details"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Logged out"
    redirect_to root_path
  end

end