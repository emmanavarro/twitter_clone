class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tweets, dependent: :destroy

  before_save :sanitisize_text

  validates :username, presence: true,
                       uniqueness: true,
                       length: { minimun: 6, maximum: 10 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                    uniqueness: true,
                    format: { with: VALID_EMAIL_REGEX },
                    length: { maximum: 30 }

  def sanitisize_text
    self.username = username.downcase
    self.name = name.titleize
    self.email = email.downcase
  end
end
