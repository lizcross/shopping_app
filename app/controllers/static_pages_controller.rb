class StaticPagesController < ApplicationController
  def home
    @products = Product.all
  end

  def cart
  	if nil != current_customer
  		@cart = current_customer.cart
  		@cartProducts = current_customer.cart.cart_products
      @cartTotal = 0.0
      @cartProducts.each do |cartProduct|
        @cartTotal += cartProduct.product.price * cartProduct.quantity
      end
  	else
  		flash[:notice] = "You must log in to create a cart"
  		redirect_to root_path
  	end
  end
end
