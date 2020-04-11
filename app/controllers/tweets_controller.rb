class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.create(tweet_params)
    if @tweet.save
      redirect_to action: :index
    else
      render :new
    end
  end

  def show
    @tweet = Tweet.find(params[:id])
    @supercool = Supercool.new
    # if @tweet.user_id == current_user.id
    #   @tweet.show(tweet_params)
    # end
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def update
    @tweet = Tweet.find(params[:id])
    if @tweet.update(tweet_params)
      redirect_to action: :index
    else
      render :edit
    end
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy if @tweet.user_id == current_user.id
  end

  private
  def tweet_params
    params.require(:tweet).permit(:image, :carname, :year, :description).merge(user_id: current_user.id)
  end
end
