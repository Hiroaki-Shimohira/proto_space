FactoryGirl.define do
	factory :user do
		# nickname "hiro"
		nickname {Faker::Name.name}
		# email    "hiro@hiro.com"
		email {Faker::Internet.email}
		password "00000000"
		member   "a"
		profile  "b"
		works    "c"
	end
end