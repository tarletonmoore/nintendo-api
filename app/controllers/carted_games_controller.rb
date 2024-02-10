class CartedGamesController < ApplicationController
  def index
    @carted_games = CartedGame.where(status: "carted", user_id: current_user.id)
    render :index
  end

  def savedindex
    @carted_games = CartedGame.where(status: "saved", user_id: current_user.id)
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
    if @carted_game.user_id == current_user.id
      @carted_game.status = "removed"
      @carted_game.save
      render json: { message: "you removed item" }
    else
      render json: { error: "Unauthorized access" }, status: :unauthorized
    end
  end

  def update
    @carted_game = CartedGame.find_by(id: params[:id])
    if @carted_game.user_id == current_user.id
      @carted_game.quantity = params[:quantity]
      @carted_game.save
    else
      render json: { error: "Unauthorized access" }, status: :unauthorized
    end
  end

  def saveforlater
    @carted_game = CartedGame.find_by(id: params[:id])
    if @carted_game.user_id == current_user.id
      @carted_game.status = "saved"
      if @carted_game.save
        render json: { message: "Successfully saved for later" }
      else
        render json: { error: @carted_game.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { error: "Unauthorized access" }, status: :unauthorized
    end
  end

  def destroysaved
    @carted_game = CartedGame.find_by(id: params[:id])
    if @carted_game.user_id == current_user.id
      @carted_game.status = "removed"
      @carted_game.save
      render json: { message: "you removed item" }
    else
      render json: { error: "Unauthorized access" }, status: :unauthorized
    end
  end
end
