class Leadership_team_member < ActiveRecord::Base
	belongs_to :sponsor
	belongs_to  :property

	mount_uploader :picture, LogoUploader
end
