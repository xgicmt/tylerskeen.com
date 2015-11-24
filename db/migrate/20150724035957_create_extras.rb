class CreateExtras < ActiveRecord::Migration
  def change
    create_table :extras do |t|
      t.references :property, index: true, foreign_key: true
      t.string :title
      t.text :body

      t.timestamps null: false
    end
  end
end
