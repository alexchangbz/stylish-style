class ProductsController < ApplicationController
  
  def new
    @product = Product.new
  end
  
  def edit
    @product = Product.find(params[:id])
  end
  
  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[:notice] = "Product's informations were successfully updated"
      redirect_to product_path(@product)
    else
      render 'edit'
    end
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