class Api::V1::UserContestBoardsController < ApplicationController
  

  def index
    boards = UserContestBoard.all
    render json: boards, status: 200
  end

end
