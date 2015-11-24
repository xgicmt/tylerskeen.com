class AddAttributesToSponsor < ActiveRecord::Migration
  def change
    add_column :sponsors, :logo, :string
    add_column :sponsors, :name, :string
    add_column :sponsors, :synopsis, :text
    add_column :sponsors, :address_street, :string
    add_column :sponsors, :address_city, :string
    add_column :sponsors, :address_state, :string
    add_column :sponsors, :address_zipcode, :string
    add_column :sponsors, :phone_number, :string

  end
end
