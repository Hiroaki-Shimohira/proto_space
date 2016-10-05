class CaptureImage < ActiveRecord::Base
	belongs_to :prototype
	enum satus: {main_image: 0, sub_image: 1}
	mount_uploader :url, ImageUploader
end
