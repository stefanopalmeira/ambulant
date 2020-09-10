class SellersController < ApplicationController
  before_action :set_user, except: :index
  before_action :check_buyer, only: :index

  def index
    @sellers = User.where(seller: true)    
    @markers = @sellers.geocoded.map do |seller|
      {
        lat: seller.lat,
        lng: seller.long,
        iconSize: [45, 45],
        url: seller_url(seller.id),
        image: seller.photo.attached? ? cl_image_path(seller.photo&.key) : helpers.asset_url('Logo_pointer.png')
      }
    end
  end

  def show
    @messages = Message.includes(:chat).where(read: false, chats:{recipient: @user, 
                created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day}).count
    @inventory = @user.selling_inventory
    respond_to do |format| 
      format.html 
      format.json { render json: { lat: @user.lat, lng: @user.long, msg: @messages } } 
    end
    @orders = @inventory.orders
    @nota = 0
    @reviewtimes = 0
    @orders.each do |order|
      @nota += order.review.rating unless order.review.nil?
      @reviewtimes += 1 unless order.review.nil?
    end
    @rating = (@nota.fdiv(@reviewtimes)).round(1)
  end

  def edit
    if current_user != @user
      redirect_to root_path, notice: "Você não pode editar esse perfil!"
    end
  end

  def update
    if current_user == @user    
      if @user.update(user_params)
        redirect_to root_path, notice: 'Perfil atualizado com sucesso'
      else
        render :edit
      end
    else
      redirect_to root_path, notice: "Você não pode editar esse perfil!"
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :address, :bio, :lat, :long, :seller, :photo)
  end

  def check_buyer
    redirect_to buyers_path if current_user.seller
  end

end
