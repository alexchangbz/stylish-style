class WelcomeController < ApplicationController
  
  def home
    
  end
  
  def shop
    @products = Product.all
  end
  
end