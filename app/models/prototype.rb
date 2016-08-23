class Prototype < ActiveRecord::Base
	belongs_to :user
	has_many :capture_images
end
