class TweetsController < ApplicationController
  before_action :set_tweet, only: [:edit,:show]
  before_action :move_to_index, except: [:index, :show]
  def index
    @tweets = Tweet.all
  end

  def new
    @tweet = Tweet.new
  end

  def create
    Tweet.create(hozon)
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
  end

  def edit
    
  end
  
  def update
    tweet = Tweet.find(params[:id])
    tweet.update(hozon)
  end
  
  def show
    
  end
  private

  def hozon
    params.require(:tweet).permit(:name, :image, :email)
  end
  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
