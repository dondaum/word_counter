class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path
      flash[:success] = "Erfolgreich angemeldet"
    else
      redirect_to '/login'
      flash[:danger] = "Falsche E-Mail oder Passwort Kombination"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
    flash[:success] = "Erfolgreich abgemeldet"
  end
end
