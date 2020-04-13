class CoolsController < ApplicationController
  def create
    @cool = current_user.supercools.create(tweet_id: params[:tweet_id])
    redirect_back(fallback_location: root_path)
  end
  
  def destroy
    @cool = Cool.find_by(tweet_id: params[:tweet_id], user_id: current_user.id)
    @cool.destroy
    redirect_back(fallback_location: root_path)
  end
end
