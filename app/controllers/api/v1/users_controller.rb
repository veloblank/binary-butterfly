class Api::V1::UsersController < ApplicationController
  def create
    user = User.find_or_initialize_by(user_params)
    #NO Authentication or Authorization is taking place
    if User.exists?(user.id)
      board = ContestBoard.last
      user_board = user.user_contest_boards.find_or_create_by(user_id: user.id, contest_board_id: board.id)
      render json: {user: user, board: board.to_json(include: [:contest_props])}, status: 200
    elsif user.save
      board = ContestBoard.last
      user_board = user.user_contest_boards.find_or_create_by(contest_board_id: board.id)
      render json: {user: user, board: board.to_json(include: [:contest_props])}, status: 200
    else
      render json: {
        message: {
          errors: user.errors.full_messages
        }
      }
    end
  end

  def show
    user = User.find_by(:id => params[:id])
    if user
      render json: user, status: 200
    else
      render json: {message: "The requested user could not be found."}
    end
  end

  def index
    users = User.all
    render json: users
  end

  private

  def user_params
    params.require(:user).permit(:username, :email)
  end
end
