class Propimage < ActiveRecord::Base
    mount_uploader :image_name, ImagenameUploader
    belongs_to :property
end
