FactoryGirl.define do
	factory :capture_image do
		url {Faker::Avatar.image}
		satus "main_image"
		association :prototype
	end
end