require "rails_helper"

RSpec.describe Purchase, type: :model do

	it "belongs to a Member" do
		room = Room.create name:"Creepy basement room", rent:200.0
		member = Member.create name:"Ralph Tirebiter", room: room

		purchase = Purchase.create description:"Rat poison", amount:10.0, member:member

		expect(purchase.member).to eq(member) 
	end

end