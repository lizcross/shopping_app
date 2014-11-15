class SessionsController < Devise::SessionsController

	def create
		super

		if signed_in? && nil == resource.cart
			resource.create_cart
		end
	end

end