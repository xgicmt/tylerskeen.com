class ChangePropertyAddress < ActiveRecord::Migration
  def change
  	remove_column :properties, :address
  	add_column :properties, :address_street, :string
  	add_column :properties, :address_city, :string
  	add_column :properties, :address_state, :string
  	add_column :properties, :address_zipcode, :string
  end
end
