class Api::V1::ContestBoardsController < ApplicationController
  def index 
    contest_boards = ContestBoard.all
    render json: @contest_boards, status: 200
  end

  def show
    @contest_board = ContestBoard.find_by(id: params[:id])
    if @contest_board
      render json: @contest_board
    else
      render json: {message: "The requested resource was not found"}
    end
  end

  def current
    contest_board = ContestBoard.all.last
    contest_props = ContestProp.filter_by_contest_board(contest_board)
    render json: contest_props, status: 200
  end
  
  def create
    @contest_board = ContestBoard.create(contest_board_params)
    render json: @contest_board, status: 200
  end
  
  def update
    @contest_board = ContestBoard.find_by(id: params[:id])
    @contest_board.update(contest_board_params)
    render json: @contest_board, status: 200
  end
  
  def destroy
    @contest_board = ContestBoard.find_by(id: params[:id])
    @contest.delete
    render json: {contest_board_id: @contest_board.id}
  end


  private
  
  def contest_board_params
    params.require(:contest_board).permit(:name)    
  end
end
