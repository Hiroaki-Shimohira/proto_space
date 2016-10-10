FactoryGirl.define do
	factory :user do
		nickname { Faker::Name.name }
		email { Faker::Internet.email }
		password "00000000"
		member   "a"
		profile  "b"
		works    "c"
	end
end
