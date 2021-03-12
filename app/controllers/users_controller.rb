class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def following
    @users = User.all
  end

  def followers
    @users = User.all
  end

end
