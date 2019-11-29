class ContestProp < ApplicationRecord

  def self.filter_by_contest_board(week)
    ContestProp.where("contest_board_id ='#{week.id}'").order(:start_time)
  end

end
