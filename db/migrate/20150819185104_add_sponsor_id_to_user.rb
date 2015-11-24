class AddSponsorIdToUser < ActiveRecord::Migration
  def change
  	add_column :users, :sponsor_id, :integer
  end
end
