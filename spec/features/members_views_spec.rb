require 'spec_helper'
require 'capybara/rails'
require 'capybara/rspec'

feature "the members interface" do
  before do
    @room = Room.create(name:"Basement", rent:100)
    @member = Member.create(name:"Ralph", room:@room)
  end

  feature "on the index page" do
    before(:each) do
      visit members_path
    end

    scenario "should list the member names" do
      expect(page).to have_content(@member.name)
    end
  end

  # feature "on the crew member page" do
  #   before(:each) do
  #     visit crew_member_path(@crew_member)
  #   end

  #   scenario "should show the crew member's credit transaction" do
  #     expect(page).to have_content("Monthly allowance")
  #   end

  #   scenario "should show the crew member's debit transaction" do
  #     expect(page).to have_content("Lost poker game")
  #   end

  #   scenario "should show the crew member's balance" do
  #     expect(page).to have_content("balance: #{@credit.amount - @debit.amount}")
  #   end
  # end

  after do
    @member.destroy
    @room.destroy
  end

end