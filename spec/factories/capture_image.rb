FactoryGirl.define do
	factory :capture_image do
		image {Faker::Avatar.image}
		association :prototype
	end
end