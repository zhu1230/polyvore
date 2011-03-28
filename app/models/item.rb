class Item < ActiveRecord::Base
	belongs_to :make_up
	belongs_to :product
end
