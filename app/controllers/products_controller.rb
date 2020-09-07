class ProductsController < ApplicationController
  before_action :set_product, only: [:edit, :update, :destroy]

  def new
    @product = Product.new
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
    authorize @product
  end

  def update
    authorize @product
    if @product.update(product_params)
      redirect_to seller_path(current_user)
    else
      render :edit
    end
  end

  def destroy
    authorize @product
    @product.destroy
    redirect_to seller_path(current_user), notice: 'Produto apagado.'
  end

  private

  def set_product
    @product = Product.find(params[:id])
    @user = @product.inventory.selling_user
  end

  def product_params
    params.require(:product).permit(:price, :name)
  end
end
