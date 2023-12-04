class FavoritesController < ApplicationController
  def create
    if current_user
      @favorite = Favorite.create(user_id: current_user.id, game_id: params[:game_id])
      render :show
    end
  end

  def destroy
    if current_user
      @favorite = Favorite.find_by(id: params[:id])
      @favorite.destroy
      render json: { message: "favorite deleted" }
    end
  end

  def index
    if current_user
      @favorites = current_user.favorites
      render :index
    end
  end
end
