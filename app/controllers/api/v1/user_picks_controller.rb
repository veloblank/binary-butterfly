class Api::V1::UserPicksController < ApplicationController
  def create
    user = User.find_by(:id => params[:user_id])
    if user
      user_pick = user.user_picks.build(
        :user_id => user.id, 
        :contest_prop_id => params[:contest_prop_id], 
        :confidence => params[:confidence],
        :side => params[:side]
      )
      if user_pick.save
        render json: user_pick, status: 200
      else
        render json: {message: "The resource you were creating has failed. Please try again."}
      end
    else
      render json: {message: "Please login before attempting to save your picks."}
    end
  end

  def index
    user = User.find_by(:id => params[:user_id])
    picks = UserPick.where("user_id = ?", user.id)
    render json: picks, status: 200
  end

  def show
    user_pick = UserPick.find_by(:id => params[:id])
    if user_pick
      render json: user_pick, status: 200
    else
      render json: {message: "The requested resource could not be retrieved."}
    end
  end

  def update
    user_pick = UserPick.find_by(:id => params[:id])
    if user_pick && user_pick.update(user_pick_params)
      render json: user_pick, status: 200
    else
      render json: {message: "The requested resource could not be retrieved and updated."}
    end

  end

  def destroy
    user_pick = UserPick.find_by(:id => params[:id])
    if user_pick
      user_pick.delete 
      render json: {user_pick_id: user_pick.id, status: 200}
    else
      render json: {message: "The requested resource could not be retrieved and deleted."}
    end
  end

  private

  def user_pick_params
    params.require(:user_pick).permit(:user_id, :contest_prop_id, :side_won, :side, :confidence)
  end

end
