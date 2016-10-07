class Prototype < ActiveRecord::Base
	belongs_to :user
	has_many :capture_images
	has_many :likes, dependent: :destroy
	has_many :comments
	accepts_nested_attributes_for :capture_images
	validates :title, presence: true
	# validates :capture_images_attributes, presence: true
	def like_user(user)
		likes.find_by(user_id: user)
	end
	def image_view(instance)
		instance.nil? ? "" : instance.url
	end
	paginates_per 8
	acts_as_taggable
	serialize :tag_list
end
