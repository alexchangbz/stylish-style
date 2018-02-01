class Product < ActiveRecord::Base
  validates :name, presence: true, length: {minimum: 3, maximum: 50 }
  validates :price, presence: true
end