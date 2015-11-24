class AddUserToSponsor < ActiveRecord::Migration
  def change
  	add_column :sponsors, :user_id, :integer
  	add_index :sponsors, :user_id
  end
end
