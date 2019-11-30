class Api::V1::UsersController < ApplicationController



  def create
    user = User.new(user_params)
    #@user.create_pick_history
    if user.save
      render json: {message: "User successfully created!"}
    else
      render json: {message: user.errors}
    end
  end


  private

  def user_params
    params.require(:user).permit(:username, :email)
  end
end
