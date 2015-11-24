class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|

      t.references :property, index: true, foreign_key: true
      t.string :file
      t.string :filename
      t.string :category

      t.timestamps null: false
    end
  end
end
