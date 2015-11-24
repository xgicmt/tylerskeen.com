class Property < ActiveRecord::Base
	belongs_to :sponsor
	has_many :propimages, :inverse_of => :property, :dependent => :destroy
#, :inverse_of => :property, :dependent => :destroy 
	has_many :leadership_team_members
	has_many :extras, :dependent => :destroy
    has_many :documents


    accepts_nested_attributes_for :propimages, reject_if: proc { |attributes| attributes['image_name'].blank? }, allow_destroy: true
    accepts_nested_attributes_for :extras, reject_if: proc { |attributes| attributes['title'].blank? }, allow_destroy: true
    accepts_nested_attributes_for :documents, reject_if: proc { |attributes| attributes['filename'].blank? }, allow_destroy: true
   # mount_uploader :image_name, ImagenameUploader
end
