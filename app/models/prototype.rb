class Prototype < ActiveRecord::Base
	belongs_to :user
	has_many :capture_images
	has_many :likes, dependent: :destroy
	accepts_nested_attributes_for :capture_images
	validates :title, presence: true
	def like_user(user)
		likes.find_by(user_id: user)
	end
end
