class ContestProp < ApplicationRecord

  def self.filter_by_contest_week(week)
    ContestProp.where("contest_week_id ='#{week.id}'").order(:start_time)
  end

end
