class User < ApplicationRecord
  has_many :user_picks
  has_many :picks, through: :user_picks
  has_many :user_contest_boards
  has_many :contest_boards, through: :user_contest_boards
  validates :email, :username, presence: true
  validates :email, :username, uniqueness: true
end
