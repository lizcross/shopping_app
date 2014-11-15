class StaticPagesController < ApplicationController
  def home
  end

  def cart
  	if nil != current_customer
  		@cart = current_customer.cart
  		@cartProducts = current_customer.cart.cart_products
  	else
  		flash[:notice] = "You must log in to create a cart"
  		redirect_to root_path
  	end
  end
end
