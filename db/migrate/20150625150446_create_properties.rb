class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :name
      t.string :address
      t.integer :purchase_price
      t.integer :min_investment
      t.text :overview
      t.integer :targeted_irr
      t.integer :targeted_hold_period
      t.integer :targeted_yield

      t.timestamps null: false
    end
  end
end
