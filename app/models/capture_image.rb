class CaptureImage < ActiveRecord::Base
	belongs_to :prototype
	enum status: {main_image:0, sub_image:1}
end
