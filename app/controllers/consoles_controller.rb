class ConsolesController < ApplicationController
  def index
    @consoles = Console.all
    render :index
  end

  def show
    @console = Console.find_by(id: params[:id])
    render :show
  end

  def create
    if current_user.admin
      @console = Console.create!(
        name: params[:name],
        image: params[:image],
        year: params[:year],
      )
      render :show
    else
      render json: { error: "Unauthorized" }, status: :unauthorized
    end
  end
end
