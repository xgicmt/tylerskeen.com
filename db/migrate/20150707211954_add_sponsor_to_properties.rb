class AddSponsorToProperties < ActiveRecord::Migration
  def change
    add_column :properties, :sponsor_id, :integer
    add_index :properties, :sponsor_id
  end
end
