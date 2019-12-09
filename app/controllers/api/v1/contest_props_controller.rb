class Api::V1::ContestPropsController < ApplicationController
  def index
    if params[:contest_board_id]
      contest_board = ContestBoard.find_by(id: params[:contest_board_id])
      if contest_board
        contest_props = contest_board.contest_props
        render json: contest_props
      else
        render json: {message: "The requested resource could not be found."}
      end
    else
      contest_props = ContestProp.all
      render json: contest_props
    end
  end
end
