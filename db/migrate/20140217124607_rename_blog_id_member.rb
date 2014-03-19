class RenameBlogIdMember < ActiveRecord::Migration
	def change
    rename_column :blogs, :id_member, :member_id
  	end
end
