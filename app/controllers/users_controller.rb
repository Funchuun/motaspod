class UsersController < ApplicationController
  def index

  end
  
  def show
    @user = User.find(params[:id])
    @user = current_user
    @tweet = Tweet.where(user_id: current_user.id)
  end
end
