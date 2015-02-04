class CartItem < ActiveRecord::Base
belongs_to :cart, class_name: 'Cart', foreign_key: 'cart_id'
belongs_to :item
before_validation :load_defaults

	def load_defaults
		if self.new_record?
			self.price = 0
		end
end
validate :pricing
def pricing
rem = 0
#rem = self.item.stock - 0
rem = 0
Item.all.each do |itemz|
	if itemz == self.item
		raise itemz.inspect
		rem = itemz.stock - self.quantity
		if rem < 0
			errors.add(:quantity, "not enough stock")
		else
			rem = itemz.stock - self.quantity

			self.price = self.quantity * itemz.price
		end
	end
end
end

end
