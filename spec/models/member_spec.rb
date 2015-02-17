require "rails_helper"

RSpec.describe Member, :type => :model do

	it "may have a Room" do
		room = Room.create name:"Creepy basement room", rent:200.0
		member = Member.create name:"Ralph Tirebiter", room: room

		expect(member.room).to eq(room)
	end

end