class Product < ApplicationRecord
	validates :name, :quantity, presence: true
end
