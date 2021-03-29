class FollowersController < ActionController::Base
  include UserScoped

  def index
    @followers_users = @user.followers.paginate(page: params[:page], per_page:10)
  end
end
