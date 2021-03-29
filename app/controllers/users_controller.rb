class UsersController < ApplicationController
  include UserScoped

  def show
    @tweets = @user.tweets.paginate(page: params[:page], per_page: 10)
  end

  def searching
    if params[:followed].present?
      @follow = User.find_by(username: params[:followed])
      if @follow != current_user
        if current_user.following.include?(@follow)
          redirect_to searching_path, alert: "You already follow @#{ @follow.username }"
        elsif !@follow
          redirect_to searching_path, alert: "That user does not exist."
        else
          user_followed = Relationship.create(follower: current_user, followed: @follow)
          redirect_to user_path(@follow.username), notice: "You are now following @#{ @follow.username }"
        end
      else
        redirect_to searching_path, alert: "Invalid operation."
      end
    end
  end
end
