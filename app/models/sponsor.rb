class Sponsor < ActiveRecord::Base
	has_many :properties
	belongs_to :User
	mount_uploader :logo, LogoUploader

  def synopsis=(val)
  	write_attribute(:synopsis, val.gsub(/[\r]/, "\n\r"))
  end


end
