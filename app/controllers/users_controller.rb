class UsersController < ApplicationController
  def index

  end
  
  def show
    @user = User.find(params[:id])
    @user = current_user
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
