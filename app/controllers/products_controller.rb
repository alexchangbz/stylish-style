class ProductsController < ApplicationController
  
  def new
    @product = Product.new
  end
  
  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "Product has been successfully added"
      redirect_to product_path(@product)
    else
      render 'new'
    end
  end
  
  def show
    @product = Product.find(params[:id])
  end
  
  private
  
  def product_params
    params.require(:product).permit(:name, :price)
  end
  
end