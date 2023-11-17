class CartedGamesController < ApplicationController
  def index
    @carted_games = CartedGame.where(status: "carted", user_id: current_user.id)
    render :index
  end

  def create
    @carted_game = CartedGame.create(
      user_id: current_user.id,
      game_id: params[:game_id],
      quantity: params[:quantity],
      status: "carted",
    )
    render :show
  end

  def destroy
    @carted_game = CartedGame.find_by(id: params[:id])
    @carted_game.status = "removed"
    @carted_game.save
    render json: { message: "you removed item" }
  end
end
