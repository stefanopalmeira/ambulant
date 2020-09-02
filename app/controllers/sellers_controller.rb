class SellersController < ApplicationController
  before_action :set_user, except: :index

  def index
    all_users = User.all
    @buyers = all_users.select do |user|
      user.seller.blank?
    end
  end

  def show
    @inventory = @user.inventory
  end

  def edit
    if current_user != @user
      redirect_to seller_path, notice: "You can't edit this profile!"
    end
  end

  def update
    if @user.update(user_params)
      redirect_to seller_path(@user), notice: 'Your profile was successfully updated.'
    else
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :address, :bio, :lat, :long, :seller, :photo)
  end
end
