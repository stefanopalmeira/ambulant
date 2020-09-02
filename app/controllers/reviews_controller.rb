class ReviewsController < ApplicationController

  def index
    @reviews = policy_scope(Review)
  end

  def show
    
  end

  def new
  end

  def create
  end

  def destroy
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end
end
