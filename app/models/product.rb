class Product < ActiveRecord::Base
has_many :comment
belongs_to :user
belongs_to :shop
validates :product_name, :price, presence: true
validates_numericality_of :price
end
