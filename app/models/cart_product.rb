class CartProduct < ApplicationRecord

	############# ASSOCIATIONS ##########
  belongs_to :product
  belongs_to :cart
end
