class ContestProp < ApplicationRecord
  belongs_to :contest_board
  has_many :user_picks 
  has_many :users, through: :user_picks

  def self.filter_by_contest_board(week)
    ContestProp.where("contest_board_id ='#{week.id}'").order(:start_time)
  end

end
