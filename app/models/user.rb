class User < ApplicationRecord
  has_many :user_picks
  has_many :picks, through: :user_picks
  validates :email, :username, presence: true
  validates :email, :username, uniqueness: true
end
