class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :destroy]

  def index
    @reviews = policy_scope(Review)
  end

  def show
    authorize @review
  end

  def new
    @order = Order.find(params[:buyer_order_id])
    @review = Review.new
    @review.order = @order
    authorize @review
  end

  def create
    @review = Review.new(set_params)
    @order = Order.find(params[:buyer_order_id])
    @review.order = @order
    if params[:complete].to_i == 1
      @review.order.completed = true
    else
      @review.order.completed = false
    end
    authorize @review
    if @review.save
      @order.save
      redirect_to review_path(@review)
    else
      render :new
    end
  end

  def destroy
    authorize @review
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def set_params
    params.require(:review).permit(:rating, :description)
  end
end
