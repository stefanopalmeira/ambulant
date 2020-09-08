class UpdateSellersController < ApplicationController
  def update
    @seller = User.find(params[:id])
    address = Geocoder.search([params[:lat].to_f, params[:long].to_f]).first.address
    @seller.address = address
    authorize @seller, policy_class: UpdateSellersPolicy
    @seller.save
  end
end
