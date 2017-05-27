class UsersController < ApplicationController
    def new
      @user = User.new
    end

    def create
      @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        flash[:success] = "You signed up successfully"
        redirect_to root_path
      else
        render :new
      end
    end

  def index
    @users = User.all
  end


  def show
    @user = User.find(params[:id])
  end


  def destroy
    @user = User.find(params[:id])
    @user.destroy
    session[:user_id] = nil
    redirect_to root_path
    flash[:danger] = "User deleted successfully"
  end

end

private

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end


  def member_since
    member_date = @user.created_at
    days_left = (Time.now - member_date).to_i / (24 * 60 * 60)
  end
