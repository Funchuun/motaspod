class TweetsController < ApplicationController
  before_action :move_to_sign_in?, except: :index

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
    @like = Like.new
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

  def move_to_sign_in?
    redirect_to new_user_session_path unless user_signed_in?
  end
end
