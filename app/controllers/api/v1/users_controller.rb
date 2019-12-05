class Api::V1::UsersController < ApplicationController
  def create
    user = User.find_or_initialize_by(user_params)
    if user.save
      render json: user
    else
      render json: {
        message: {
          errors: user.errors.full_messages
        }
      }
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
