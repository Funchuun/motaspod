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

  def search
    if params[:carname].present?
      @carnames = Tweet.where('carname LIKE ?', "%#{params[:carname]}%")
    else
      @carnames = Tweet.none
    end

    if params[:year].present?
      @years = Tweet.where('year LIKE ?', "%#{params[:year]}%")
    else
      @years = Tweet.none
    end
    
    if params[:description].present?
      @descriptions = Tweet.where('description LIKE ?', "%#{params[:description]}%")
    else
      @descriptions = Tweet.none
    end
  end

  private
  def tweet_params
    params.require(:tweet).permit(:image, :carname, :year, :description).merge(user_id: current_user.id)
  end

  def move_to_sign_in?
    redirect_to new_user_session_path unless user_signed_in?
  end
end
