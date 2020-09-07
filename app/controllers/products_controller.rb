class ProductsController < ApplicationController
  before_action :set_product, only: [:edit, :update, :destroy]

  def new
    @user = @current_user
    @inventory = @user.selling_inventory
    @product = Product.new
    @product.inventory = @inventory
    authorize @product
  end

  def create
    @product = Product.new(product_params)
    @product.inventory = current_user.selling_inventory
    authorize @product
    if @product.save
      redirect_to seller_path(current_user), alert: 'Produto criado.'
    else
      render :new
    end
  end

  def edit
    @user = @product.inventory.selling_user
    @inventory = @user.selling_inventory
    authorize @product
  end

  def update
    @user = @product.inventory.selling_user
    authorize @product
    if @product.update(product_params)
      redirect_to seller_path(current_user)
    else
      render :edit
    end
  end

  def destroy
    @user = @product.inventory.selling_user
    authorize @product
    @product.destroy
    redirect_to seller_path(current_user), notice: 'Produto apagado.'
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:price, :name)
  end
end
