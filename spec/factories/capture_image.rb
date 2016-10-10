include ActionDispatch::TestProcess
FactoryGirl.define do
	factory :capture_image do

		trait :main do
			satus "main_image"
		end

		trait :image do
			image_url { fixture_file_upload("spec/fixtures/img/スクリーンショット 2016-10-10 17.45.24.jpg", 'image/jpg') }
		end
		trait :image_blank do
			image_url ""
		end

		association :prototype
	end
end
