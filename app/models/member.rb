class Member < ActiveRecord::Base
	has_one :room
	has_many :purchases

	def room_name
		if room != nil
			room.name
		else
			"No room"
		end
	end

	def room_rent
		if room != nil
			room.rent
		else
			0
		end
	end

	def rent_after_purchases
		expenses = purchases.reduce(0) { |sum, purchase| sum += purchase.amount }
		room_rent - expenses
	end
end