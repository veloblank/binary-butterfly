class ContestBoard < ApplicationRecord
  has_many :contest_props
  has_many :user_contest_boards
  has_many :users, through: :user_contest_boards
  validates :name, uniqueness: true

end
