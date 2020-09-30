class Product < ApplicationRecord
	
	############# VALIDATIONS ###########
  validates :name, :description, :make, presence: true

  ############# ASSOCIATIONS ##########
  has_many :cart_products
  has_many :carts, through: :cart_products
  
end
