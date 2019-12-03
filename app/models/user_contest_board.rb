class UserContestBoard < ApplicationRecord
  belongs_to :user
  belongs_to :contest_board
end
