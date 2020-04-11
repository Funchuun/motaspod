class SupercoolsController < ApplicationController
  def create
    @supercool = current_user.supercools.create(tweet_id: params[:tweet_id])
    redirect_back(fallback_location: root_path)
  end
  
  def destroy
    @supercool = Supercool.find_by(tweet_id: params[:tweet_id], user_id: current_user.id)
    @supercool.destroy
    redirect_back(fallback_location: root_path)
  end
end
