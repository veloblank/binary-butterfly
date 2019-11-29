class Api::V1::ContestPropsController < ApplicationController

  def index
    contest_params = params[:contest_week_id]
    contest_week = ContestWeek.find_by(:id => params[:contest_week_id])
    
    if contest_params == "current"
      contest_week = ContestWeek.all.last
    elsif contest_week 
      contest_props = ContestProp.filter_by_contest_week(contest_week)
    else
      contest_props = ContestProp.all
    end

    render json: contest_props, status: 200

  end
end
