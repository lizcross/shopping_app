class RegistrationsController < Devise::RegistrationsController

	def create
		super

		if signed_in? && nil == resource.cart
			resource.create_cart
		end
	end
 
  private
 
  def sign_up_params
    params.require(:customer).permit(:name, :email, :password, :password_confirmation)
  end
 
  def account_update_params
    params.require(:customer).permit(:name, :email, :password, :password_confirmation, :current_password)
  end
end