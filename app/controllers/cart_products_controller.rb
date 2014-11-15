class CartProductsController < ApplicationController
	def create
		@cartProduct = current_customer.cart.cart_products.build(cart_product_params)
	    if @cartProduct.save
	      redirect_to cart_path
	    else
	      flash[:notice] = "You must log in to add an item to your cart"
	    end
	end

	def update
	end

	def destroy
	end

	private

    def cart_product_params
      params.require(:cart_product).permit(:product_id, :quantity)
    end
end