class Cart < ActiveRecord::Base
STATUSES = [ "pending" , "paid" ]
validates :status,  inclusion: { in: STATUSES }
has_many :cart_items
accepts_nested_attributes_for :cart_items
validate :checkout 
def checkout
	if self.status == "paid"
	CartItem.all.each do |pay|
	if pay.cart == self
	rem = pay.item.stock - pay.quantity
	pay.item.update(:stock => rem)

	end
	end
	end
end
end
