class UpdateSellersController < ApplicationController
  def update
    @seller = User.find(params[:id])
    data = Geocoder.search([params[:lat].to_f, params[:long].to_f]).first.data
    road = data['address']['road']
    number = data['address']['house_number']
    town = data['address']['town']
    state = data['address']['state']
    address2 = "#{road}, #{number}, #{town}, #{state}"
    if(Geocoder.search(data).blank?)
      @seller.address = address2
    else
      @seller.address = address
    end
    authorize @seller, policy_class: UpdateSellersPolicy
    @seller.save
  end
end
