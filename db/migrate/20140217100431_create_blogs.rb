class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.integer :id_member
      t.text :content

      t.timestamps
    end
  end
end
