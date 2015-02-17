class Member < ActiveRecord::Base
	has_one :room
	has_many :purchases
end