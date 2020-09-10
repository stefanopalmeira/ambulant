class InventoriesController < ApplicationController
  before_action :set_inventory, only: [:show, :edit, :update, :destroy]

#  def show
#   authorize @inventory
#  end

 def new
  @inventory = Inventory.new
  authorize @inventory
 end

 def create
  @inventory = Inventory.new(inventory_params)
  @inventory.selling_user = current_user
  if @inventory.save
    redirect_to inventory_path(@inventory)
  else
    render :new
  end

 end

 def edit
  authorize @inventory
  @user = @inventory.selling_user
 end

 def update
  authorize @inventory
  @user = @inventory.selling_user
  if @inventory.update(inventory_params)
    redirect_to seller_path(@current_user)
  else
    render :edit
  end
 end

#  def destroy
#   authorize @inventory
#   @inventory.destroy
#   redirect_to root_path
#  end


 private

 def set_inventory
  @inventory = Inventory.find(params[:id])
 end

 def inventory_params
  params.require(:inventory).permit(:name, :description, :photos)
 end

end
