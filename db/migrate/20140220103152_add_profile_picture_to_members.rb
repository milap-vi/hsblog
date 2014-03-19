class AddProfilePictureToMembers < ActiveRecord::Migration
  def change
    add_column :members, :profile_picture, :string
  end
end
