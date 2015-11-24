class AddFieldsToLeadership < ActiveRecord::Migration
  def change
  	add_column :leadership_team_members, :sponsor_id, :integer
    add_index :leadership_team_members, :sponsor_id
 
  end
end
