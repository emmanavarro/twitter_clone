class Tweet < ApplicationRecord
  belongs_to :user

  default_scope -> { order(created_at: :DESC) }

  validates :tweet, presence: true, length: { minimum: 1, maximum: 280 }
end
