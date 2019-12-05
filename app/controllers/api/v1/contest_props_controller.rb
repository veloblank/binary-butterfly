class Api::V1::ContestPropsController < ApplicationController

  def index
    contest_params = params[:contest_board_id]
    contest_board = ContestBoard.find_by(:id => params[:contest_board_id])
    
    if contest_params == "current"
      contest_board = ContestBoard.all.last
    elsif contest_board 
      contest_props = ContestProp.filter_by_contest_board(contest_board)
    else
      contest_props = ContestProp.all
    end

    render json: contest_props

  end
end
