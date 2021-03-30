class UsersController < ApplicationController
  include UserScoped

  def new; end

  def show
    @tweets = @user.tweets.paginate(page: params[:page], per_page: 10)
  end

  def searching
    return redirect_to searching_path if params[:followed].blank?

    @follow = User.find_by(username: params[:followed])
    return redirect_to searching_path, alert: 'That user does not exist.' if @follow.blank?

    return redirect_to searching_path, alert: 'Invalid operation.' if current_user == @follow

    if current_user.following.include?(@follow)
      return redirect_to searching_path, alert: "You already follow @#{@follow.username}"
    end

    user_followed = Relationship.create(follower: current_user, followed: @follow)
    redirect_to user_path(@follow.username), notice: "You are now following @#{@follow.username}"
  end

end
