class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      render json: user
    else
      render json: {
        message: {
          errors: user.errors.full_messages
        },
        status: 204
      }
    end
  end

  def login
    user = User.find_or_create_by(user_params)
    if user 
      render json: user
    else 
      render json: {message: "You could not be logged in!"}
    end
  end


  private

  def user_params
    params.require(:user).permit(:username, :email)
  end
end
