class Product < ActiveRecord::Base
	has_many :cart_products
	has_many :carts, :through => :cart_products

	validates :name, presence: true
	validates :description, presence:true
	validates :price, presence:true
end
