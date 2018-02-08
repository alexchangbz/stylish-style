class WelcomeController < ApplicationController
  
  def home
    
  end
  
  def shop
    @products = Product.paginate(page: params[:page], per_page: 12)
    @welcome = @products
  end
  
end