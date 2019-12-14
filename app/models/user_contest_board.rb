class UserContestBoard < ApplicationRecord
  belongs_to :user
  belongs_to :contest_board
  #has_many :user_picks

  def self.cb_id_specific_boards(id)
    UserContestBoard.where(contest_board_id: id)
  end

  def self.uid_specific_boards(id)
    UserContestBoard.where(user_id: id)
  end
  
  # def self.prop_specific_boards(prop_id)
  #   UserContestBoard.where(prop_id: id)
  # end
end
