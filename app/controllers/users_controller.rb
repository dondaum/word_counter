class UsersController < ApplicationController
    def new
      @user = User.new
    end

    def create
      @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        flash[:notice] = "You signed up successfully"
        flash[:color]= "valid"
        redirect_to root_path
      else
        flash[:notice] = "Form is invalid"
        flash[:color]= "invalid"
        render :new
      end
    end

  def index
    @users = User.all
  end


  def show
    @user = User.find(params[:id])
  end
end

private

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
