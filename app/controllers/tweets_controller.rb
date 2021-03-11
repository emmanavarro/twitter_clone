class TweetsController < ApplicationController
  before_action :set_tweet, only: [:show, :update, :edit, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @tweets = Tweet.all.order('created_at DESC').paginate(page: params[:page], per_page: 10)
    @tweet = Tweet.new
  end

  def show; end

  def new
    @tweet = current_user.tweets.build
  end

  def edit; end

  def create
    @tweet = current_user.tweets.build(tweet_params)

    if @tweet.save
      flash[:notice] = "Tweet was successfully created."
      redirect_to tweets_path(@tweet)
    else
      render :new
    end
  end

  def update
    if @tweet.update(tweet_params)
      flash[:notice] = "Tweet was successfully updated."
      redirect_to @tweet
    else
      render :edit
    end
  end

  def destroy
    @tweet.destroy
    flash[:notice] = "Tweet was successfully deleted."
    redirect_to tweets_path
  end

  private

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

  def tweet_params
    params.require(:tweet).permit(:tweet)
  end
end
