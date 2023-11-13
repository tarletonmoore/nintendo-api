class GamesController < ApplicationController
  def index
    @games = Game.all
    render :index
  end

  def show
    @game = Game.find_by(id: params[:id])
    render :show
  end

  def create
    if current_user.admin
      @game = Game.create!(
        title: params[:title],
        image: params[:image],
        price: params[:price],
        console_id: params[:console_id],
      )
      render :show
    else
      render json: { error: "Unauthorized" }, status: :unauthorized
    end
  end
end
