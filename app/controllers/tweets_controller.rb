class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.create(tweet_params)
  end

  private
  def tweet_params
    params.require(:tweet).permit(:image, :carname, :year, :description)
  end
end
