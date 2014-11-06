class Product < ActiveRecord::Base
	has_many :cart_products
	has_many :carts, :throught => :cart_products
	
	validates :name, presence: true
	validates :description, presence:true
	validates :price, presence:true
end
