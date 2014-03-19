class CreateMemberDetails < ActiveRecord::Migration
  def change
    create_table :member_details do |t|
      t.integer :member_id
      t.string :address
      t.text :description
      t.string :role

      t.timestamps
    end
  end
end
