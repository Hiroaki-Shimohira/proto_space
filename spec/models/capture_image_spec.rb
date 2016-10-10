require 'rails_helper'
describe CaptureImage  do
	describe "#main_image?" do
		it "valid with main_image" do
			capture_image = build(:capture_image)
			binding.pry
			expect(capture_image).to be_valid
		end
	end
	describe "validations" do
		it "invalid with image" do
			capture_image = build(:capture_image, image_url: "")
			capture_image.valid?
			expect(capture_image.errors[:image_url]).to include("can't be blank")
		end
	end
end