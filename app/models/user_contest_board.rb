class UserContestBoard < ApplicationRecord
  belongs_to :user
  belongs_to :contest_board
  #has_many :user_picks

  def self.id_specific_boards(id)
    UserContestBoard.where(contest_board_id: id)
  end
end
