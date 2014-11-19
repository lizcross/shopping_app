class CartProductsController < ApplicationController
	before_action :logged_in_customer, only: [:create, :update, :destroy]
	before_action :correct_user,   only: [:destroy, :update]

	def create
		@cartProduct = current_customer.cart.cart_products.build(cart_product_params)
	    if @cartProduct.save
	      redirect_to cart_path
	    else
	      flash[:notice] = "You must log in to add an item to your cart"
	    end
	end

	def update
		if @cartProduct.update_attributes(cart_product_params)
			redirect_to cart_path
		else
			flash[:alert] = "The cart could not be updated at this time"
		end
	end

	def destroy
		@cartProduct.destroy
		redirect_to cart_path
	end

	private

    def cart_product_params
      params.require(:cart_product).permit(:product_id, :quantity)
    end

    def correct_user
      @cartProduct = current_customer.cart.cart_products.find_by(id: params[:id])
      redirect_to root_url if @cartProduct.nil?
    end
end