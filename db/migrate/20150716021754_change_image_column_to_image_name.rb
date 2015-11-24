class ChangeImageColumnToImageName < ActiveRecord::Migration
  def change
  	remove_column :propimages, :image, :string
  	add_column :propimages, :image_name, :string
  end
end
