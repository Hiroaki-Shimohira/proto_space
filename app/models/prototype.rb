class Prototype < ActiveRecord::Base
	belongs_to :user
	has_many :capture_images, dependent: :destroy
	has_many :likes, dependent: :destroy
	has_many :comments, dependent: :destroy
	accepts_nested_attributes_for :capture_images
	validates :title, presence: true
	def like_user(user)
		likes.find_by(user_id: user)
	end
	def image_view(instance)
		instance.nil? ? "" : instance.image_url
	end
	paginates_per 8
	acts_as_taggable
	serialize :tag_list
end
