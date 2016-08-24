class Prototype < ActiveRecord::Base
	belongs_to :user
	has_many :capture_images
	accepts_nested_attributes_for :capture_images
end
