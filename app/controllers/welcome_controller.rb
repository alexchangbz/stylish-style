class WelcomeController < ApplicationController
  
  def home
    redirect_to shop_path if logged_in?
  end
  
  def shop
    @products = Product.paginate(page: params[:page], per_page: 12)
    @welcome = @products
  end
  
end