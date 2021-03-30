class Tweet < ApplicationRecord
  belongs_to :user, counter_cache: true

  default_scope -> { order(created_at: :DESC) }

  validates :tweet, presence: true, length: { minimum: 1, maximum: 280 }
end
