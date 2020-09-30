class Api::V1::ProductsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    #Return all products
    render json: {
      data: Product.all.as_json
    }
  end

  def add_to_cart
    # find product which users request to push into the cart.
    product = Product.find_by_id(params[:product_id])
    # check if product present and current user not alrady having the product in his cart.
    if product.present? && !current_user.cart_products.where(product_id: product.id).present?
      # create new cart product with respect to the user.
      cart_product = product.cart_products.new(cart: current_user.cart)
      if cart_product.save
        render json: {
          messages: "added Successfully",
          is_success: true,
          data: {product: product}
        }, status: :ok
      else
        render json: {
          messages: cart_product.errors.full_messages.to_sentence,
          is_success: false,
        }, status: :unprocessable_entity
      end
    else
      # return error says that Product already exists in your cart
      render json: {
          messages: 'Product already exists in your cart',
          is_success: false,
        }, status: :ok
    end
  end

  def cart_products
    # return all the user cart products
    render json: {
      data: current_user.cart.products.as_json
    }
  end
end
