class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @tweets = @user.tweets.paginate(page: params[:page], per_page: 10)
  end

  def following
    @user = User.find(params[:id])
  end

  def followers
    @user = User.find(params[:id])
  end

end
