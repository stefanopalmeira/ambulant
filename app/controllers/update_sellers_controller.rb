class UpdateSellersController < ApplicationController
  def update
    @seller = User.find(params[:id])
    authorize @seller, policy_class: UpdateSellersPolicy
    if @seller.long != params[:long] 
      @seller.long = params[:long]
    end
    if @seller.lat != params[:lat] 
      @seller.lat != params[:lat]
    end
    @seller.save
    puts 'deu certo' 
  end
end
