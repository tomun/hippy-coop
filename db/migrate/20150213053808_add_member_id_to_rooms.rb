class AddMemberIdToRooms < ActiveRecord::Migration
  def change
    add_column :rooms, :member_id, :integer
  end
end
