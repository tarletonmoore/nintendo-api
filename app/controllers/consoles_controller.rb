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
    @console = Console.create!(
      name: params[:name],
      image: params[:image],
      year: params[:year],
    )
    render :show
  end
end
