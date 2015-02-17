require "rails_helper"

RSpec.describe Room do

	it "has a Member" do
		room = Room.create name:"Creepy basement room", rent:200.0
		member = Member.create name:"Ralph Tirebiter", room: room

		expect(room.member).to eq(member) 
	end

end