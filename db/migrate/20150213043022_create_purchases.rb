class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.string :description
      t.decimal :amount
      t.integer :member_id
    end
  end
end
