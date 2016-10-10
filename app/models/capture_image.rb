class CaptureImage < ActiveRecord::Base
	belongs_to :prototype
	enum satus: {main_image: 0, sub_image: 1}
	mount_uploader :image_url, ImageUploader
	validates :image_url, presence: true, if: :main_image?

	def main_image?
		satus == "main_image"
	end
end
