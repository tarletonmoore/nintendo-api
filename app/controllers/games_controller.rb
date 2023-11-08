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
    @game = Game.create!(
      title: params[:title],
      image: params[:image],
      console_id: params[:console_id],
    )
    render :show
  end
end
