class CartProductsController < ApplicationController
	#need to add before_actions here
	
	def create
		@cartProduct = current_customer.cart.cart_products.build(cart_product_params)
	    if @cartProduct.save
	      redirect_to cart_path
	    else
	      flash[:notice] = "You must log in to add an item to your cart"
	    end
	end

	def update
		@cartProduct = CartProduct.find(params[:id])
		if @cartProduct.update_attributes(cart_product_params)
			redirect_to cart_path
		else
			flash[:alert] = "The cart could not be updated at this time"
		end
	end

	def destroy
		CartProduct.find(params[:id]).destroy
		redirect_to cart_path
	end

	private

    def cart_product_params
      params.require(:cart_product).permit(:product_id, :quantity)
    end
end