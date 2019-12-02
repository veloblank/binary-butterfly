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
        render json: user_pick
      else
        render json: {message: "The resource you were creating has failed. Please try again."}
      end
    end
  end

  def index
    user = User.find_by(:id => params[:user_id])
    picks = UserPick.where("user_id = ?", user.id)
    render json: picks
  end



end
