class ProductsController < ApplicationController
  
before_action :require_admin
  
  def index
    @products = Product.all
  end
  
  def new
    @product = Product.new
  end
  
  def edit
    @product = Product.find(params[:id])
  end
  
  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[:success] = "Product's informations were successfully updated"
      redirect_to product_path(@product)
    else
      render 'edit'
    end
  end
  
  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:success] = "Product has been successfully added"
      redirect_to product_path(@product)
    else
      render 'new'
    end
  end
  
  def show
    @product = Product.find(params[:id])
  end
  
  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:danger] = "The product has been successfully removed"
    redirect_to products_path
  end
  
  private
  
  def product_params
    params.require(:product).permit(:name, :price)
  end
  
  def require_admin
    if !current_user.admin?
      flash[:danger] = "Only the administrator can perform this action"
      redirect_to root_path
    end
  end
  
end