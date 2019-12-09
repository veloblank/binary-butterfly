class Api::V1::UsersController < ApplicationController
  def create
    user = User.find_or_initialize_by(user_params)
    #NO Authentication or Authorization is taking place
    if User.exists?(user.id)
      render json: user, status: 200
    elsif user.save
      render json: user, status: 204
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
