class AddTweetToTweets < ActiveRecord::Migration[6.1]
  def change
    add_column :tweets, :tweet, :text
  end
end
