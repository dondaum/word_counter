class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path
      flash[:success] = "Successfull login"
    else
      redirect_to '/login'
      flash[:danger] = "Wrong E-Mail or password combination"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
    flash[:danger] = "Successfully loged out"
  end
end
