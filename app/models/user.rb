class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tweets, dependent: :destroy

  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy

  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  before_save :sanitisize_text

  validates :username, presence: true, uniqueness: true,
                       length: { minimun: 6, maximum: 10 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true,
                    format: { with: VALID_EMAIL_REGEX },
                    length: { maximum: 30 }

  def sanitisize_text
    self.username = username.downcase
    self.name = name.titleize
    self.email = email.downcase
  end

  # follow another user
  def follow(other)
    active_relationships.create(followed_id: other.id)
  end

  # unfollow an user
  def unfollow(other)
    active_relationships.find_by(followed_id: other.id).destroy
  end

  # is following an user?
  def following?(other)
    following.include?(other)
  end
end
