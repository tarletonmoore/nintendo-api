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
        stock: params[:stock],
        console_id: params[:console_id],
      )
      render :show
    else
      render json: { error: "Unauthorized" }, status: :unauthorized
    end
  end

  def update
    @game = Game.find_by(id: params[:id])
    @game.title = params[:title] || @game.title
    @game.image = params[:image] || @game.image
    @game.price = params[:price] || @game.price
    @game.stock = params[:stock] || @game.stock

    @game.save
    if @game.valid?
      render template: "games/show"
    else
      render json: { errors: @game.errors.full_messages }
    end
  end
end
