class AddSubjectToBlogs < ActiveRecord::Migration
  def change
    add_column :blogs, :subject, :string, :after => :id_member
  end
end
