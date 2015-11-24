class CreatePropimages < ActiveRecord::Migration
  def change
    create_table :propimages do |t|
      t.references :property, index: true, foreign_key: true
      t.string :image

      t.timestamps null: false
    end
  end
end
