include ActionDispatch::TestProcess
FactoryGirl.define do
	factory :capture_image do
		satus "main_image"
		image_url { fixture_file_upload("spec/fixtures/img/スクリーンショット 2016-10-10 17.45.24.jpg", 'image/jpg') }
		association :prototype
	end
end