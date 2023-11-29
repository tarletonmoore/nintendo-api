class ReviewsController < ApplicationController
  def create
    if current_user
      @review = Review.create(
        user_id: current_user.id,
        game_id: params[:game_id],
        review: params[:review],
      )
      render :show
    end
  end

  def update
    @review = Review.find_by(id: params[:id])
    if @review.user_id == current_user.id
      @review.review = params[:review] || @review.review
      @review.save
      if @review.valid?
        render :show
      else
        render json: { errors: @review.errors.full_messages }
      end
    else
      render json: { error: "You are not authorized to update this review" }, status: :unauthorized
    end
  end

  def destroy
    @review = Review.find_by(id: params[:id])
    if @review.user_id == current_user.id
      @review.destroy
      render json: { message: "You deleted your review" }
    else
      render json: { error: "You are not authorized to delete this review" }, status: :unauthorized
    end
  end
end
