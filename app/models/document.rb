class Document < ActiveRecord::Base

	belongs_to :property

	mount_uploader :file, DocumentUploader
end
