class ProductsController < ApplicationController
  def show
  	@product = Product.find(params[:id])

  	if customer_signed_in?
  		@cart_product = current_customer.cart.cart_products.build(product_id: @product.id)
  	end
  end
end
