require "rails-helper"
describe Capture_image  do
	describe "#main_image?" do
		it "valid with main_image" do
			capture_image = build(:capture_image)
			expect(capture_image).to be_valid
		end
	end
	describe "validations" do
		it "invalid with image" do
			capture_image = build(:capture_image, url: "")
			caprure_image.valid?
			expect(caprure_image.errors[:url]).to include("can't be blank")
	end
end