class OrdersController < ApplicationController
  before_action :authenticate_user

  def show
    @order = Order.find_by(id: params[:id])
    if @order.user_id == current_user.id
      render :show
    else
      render json: { message: "unauthorized" }
    end
  end

  def index
    @orders = current_user.orders
    render :index
  end

  def create
    @carted_games = CartedGame.where(status: "carted", user_id: current_user.id)

    calculated_subtotal = 0
    @carted_games.each do |carted_game|
      calculated_subtotal += carted_game.game.price * carted_game.quantity
    end

    calculated_tax = calculated_subtotal * 0.09
    calculated_total = calculated_subtotal + calculated_tax
    @order = Order.create(
      user_id: current_user.id,
      subtotal: calculated_subtotal,
      tax: calculated_tax,
      total: calculated_total,

    )
    if @order.valid?
      @carted_games.each do |carted_game|
        carted_game.status = "purchased"
        carted_game.order_id = @order.id
        carted_game.save
      end
      render :show
    else
      render json: { errors: @order.errors.full_messages }
    end
  end
end
