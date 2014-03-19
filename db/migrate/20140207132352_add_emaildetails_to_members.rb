class AddEmaildetailsToMembers < ActiveRecord::Migration
  def change
    add_column :members, :email, :string, :after => :username
  end
end
